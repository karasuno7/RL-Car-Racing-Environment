%% Environment Definition
clear
close all
Ts = 0.1;
mdl = 'LKATestBenchExampleRL';
helperLKASetUp
open_system(mdl);
%% Use any of the below 3 modes to train your agent
observationMode = 3;
switch observationMode
    case 1
        numObsv = 8;
        limObsvLower = [-0.01 -0.001 -1 -10 -10 -1.6 -10 -10]';
        limObsvUpper = [0.01  0.001  1  10  10  1.6  10  10]';
    case 2
        numObsv = 4;
        limObsvLower = [-0.01 -0.001 -1 -1.6]';
        limObsvUpper = [0.01  0.001  1  1.6]';
    case 3
        numObsv = 2;
        limObsvLower = [-1 -1.6]';
        limObsvUpper = [1  1.6]';
end
%% Do not Modify
agentblk = [mdl '/RL Agent'];
set_param(agentblk,'Commented','off')
set_param(switchblk,'sw','1')
observationInfo = rlNumericSpec([numObsv 1],'LowerLimit',limObsvLower,'UpperLimit',limObsvUpper);
observationInfo.Name = 'observations';
observationInfo.Description = 'information on lateral deviation and relative yaw angle';
numActions = 1;
actionInfo = rlNumericSpec([numActions 1],'LowerLimit',-0.025,'UpperLimit',0.025);
actionInfo.Name = 'steering';
env = rlSimulinkEnv(mdl,agentblk,observationInfo,actionInfo);
%% Create critic network (Tunable)
L = 100; % number of neurons (tunable)
statePath = [
    featureInputLayer(numObsv,'Normalization','none','Name','observation')
    fullyConnectedLayer(L,'Name','fc1')
    reluLayer('Name','relu1')
    fullyConnectedLayer(L,'Name','fc2')
    additionLayer(2,'Name','add')
    reluLayer('Name','relu2')
    fullyConnectedLayer(L,'Name','fc3')
    reluLayer('Name','relu3')
    fullyConnectedLayer(numActions,'Name','fc4')];

actionPath = [
    featureInputLayer(1,'Normalization','none','Name','action')
    fullyConnectedLayer(L, 'Name', 'fc5')];

criticNetwork = layerGraph(statePath);
criticNetwork = addLayers(criticNetwork, actionPath);
    
criticNetwork = connectLayers(criticNetwork,'fc5','add/in2');
% plot(criticNetwork)
%% Create critic representation (Tunable)
criticOptions = rlRepresentationOptions('LearnRate',1e-3,'GradientThreshold',1,'L2RegularizationFactor',1e-4);
critic = rlQValueRepresentation(criticNetwork,observationInfo,actionInfo,...
    'Observation',{'observation'},'Action',{'action'},criticOptions);
%% Create actor representation (Tunable)
actorNetwork = [
    featureInputLayer(numObsv,'Normalization','none','Name','observation')
    fullyConnectedLayer(L,'Name','fc1')
    reluLayer('Name','relu1')
    fullyConnectedLayer(L,'Name','fc2')
    reluLayer('Name','relu2')
    fullyConnectedLayer(L,'Name','fc3')
    reluLayer('Name','relu3')
    fullyConnectedLayer(numActions,'Name','fc4')
    tanhLayer('Name','tanh1')
    scalingLayer('Name','ActorScaling1','Scale',0.2618,'Bias',0)];

actorOptions = rlRepresentationOptions('LearnRate',1e-3,'GradientThreshold',1,'L2RegularizationFactor',1e-4);
actor = rlDeterministicActorRepresentation(actorNetwork,observationInfo,actionInfo,...
    'Observation',{'observation'},'Action',{'ActorScaling1'},actorOptions);
%% Create DDPG agent - Do Not Modify
agentOptions = rlDDPGAgentOptions(...
    'SampleTime',Ts,...
    'TargetSmoothFactor',1e-3,...
    'ExperienceBufferLength',1e6,...
    'DiscountFactor',0.99,...
    'MiniBatchSize',64);
agentOptions.NoiseOptions.Variance = 0.002;
agentOptions.NoiseOptions.VarianceDecayRate = 1e-5;
agent = rlDDPGAgent(actor,critic,agentOptions);
%% Train agent
maxepisodes = 5000;
maxsteps = ceil(simStopTime/Ts);
trainingOpts = rlTrainingOptions(...
    'MaxEpisodes',maxepisodes,...
    'MaxStepsPerEpisode',maxsteps,...
    'Verbose',false,...
    'Plots','training-progress',...
    'StopTrainingCriteria','EpisodeReward',...
    'StopTrainingValue',300,...
    'SaveAgentCriteria','EpisodeReward',...
    'SaveAgentValue',200);
doTraining = true;

if doTraining    
    % Train the agent.
    trainingStats = train(agent,env,trainingOpts);
else
    % Load a pretrained agent from the savedAgents directory.
    load('SimulinkACCDDPG.mat','agent') 
    
end