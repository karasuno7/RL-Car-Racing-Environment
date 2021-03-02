%% Environment Definition
clear
close all
Ts = 0.1;
mdl = 'LKATestBenchExampleRL';
helperLKASetUp
open_system(mdl);
%%
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
%%
agentblk = [mdl '/RL Agent'];
set_param(agentblk,'Commented','off')
set_param(switchblk,'sw','1')
observationInfo = rlNumericSpec([numObsv 1],'LowerLimit',limObsvLower,'UpperLimit',limObsvUpper);
observationInfo.Name = 'observations';
observationInfo.Description = 'information on lateral deviation and relative yaw angle';
numActions = 1;
actionInfo = rlFiniteSetSpec(-0.025:0.005:0.025);
actionInfo.Name = 'steering';
env = rlSimulinkEnv(mdl,agentblk,observationInfo,actionInfo);
%% DQN agent creation
nI = numObsv;  % number of inputs (6)
nL = 24;                            % number of neurons
nO = numel(actionInfo.Elements);    % number of outputs (31)

dnn = [
    featureInputLayer(nI,'Normalization','none','Name','state')
    fullyConnectedLayer(nL,'Name','fc1')
    reluLayer('Name','relu1')
    fullyConnectedLayer(nL,'Name','fc2')
    reluLayer('Name','relu2')
    fullyConnectedLayer(nO,'Name','fc3')];
figure
plot(layerGraph(dnn))
criticOptions = rlRepresentationOptions('LearnRate',1e-3,'GradientThreshold',1,'L2RegularizationFactor',1e-4);
critic = rlQValueRepresentation(dnn,observationInfo,actionInfo,...
    'Observation',{'state'},criticOptions);
agentOptions = rlDQNAgentOptions(...
    'SampleTime',Ts,...
    'UseDoubleDQN',true,...
    'TargetSmoothFactor',1e-3,...
    'DiscountFactor',0.99,...
    'ExperienceBufferLength',1e6,...
    'MiniBatchSize',64);
agent = rlDQNAgent(critic,agentOptions);
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
    % Load a pretrained agent for the example.
    load('SimulinkACCDDPG.mat','agent')       
end