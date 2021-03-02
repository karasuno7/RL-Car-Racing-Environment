% Set up Script for the Lane Keeping Assist (LKA) Example
%
% This script initializes the LKA example model. It loads necessary control
% constants and sets up the buses required for the referenced model
%
%   This is a helper script for example purposes and may be removed or
%   modified in the future.

%   Copyright 2017-2018 The MathWorks, Inc.

%% General Model Parameters
Ts = 0.1;               % Simulation sample time                (s)

%% Ego Car Parameters
% Dynamics modeling parameters
m       = 1575;     % Total mass of vehicle                          (kg)
Iz      = 2875;     % Yaw moment of inertia of vehicle               (Kgm^2)
lf      = 1.2;      % Longitudinal distance from c.g. to front tires (m)
lr      = 1.6;      % Longitudinal distance from c.g. to rear tires  (m)
Cf      = 19000;    % Cornering stiffness of front tires             (N/rad)
Cr      = 33000;    % Cornering stiffness of rear tires              (N/rad)

%% Controller parameter
PredictionHorizon = 30; % Number of steps for preview    (N/A)

%% Bus Creation
% Create buses for lane sensor and lane sensor boundaries
createLaneSensorBuses
% Create the bus of actors from the scenario reader
modelName = 'LKATestBenchExampleRL';
open_system(modelName);
agentblk = [modelName '/RL Agent'];
switchblk = [modelName '/Manual Switch'];
set_param(agentblk,'Commented','on')
set_param(switchblk,'sw','0')
wasModelLoaded = bdIsLoaded(modelName);
if ~wasModelLoaded
    load_system(modelName)
end
% load the bus for scenario reader
blk=find_system(modelName,'System','driving.scenario.internal.ScenarioReader');
s = get_param(blk{1},'PortHandles');
get(s.Outport(1),'SignalHierarchy');

%% Create scenario and road specifications
testID = 1;
switch testID
    case 1
        scenarioFcnName = "LKATestBenchScenario";
    case 2 %future developement
        scenarioFcnName = "CurvedHighway";
end
scenarioFcnHandle = str2func(scenarioFcnName);
[scenario, egoVehicle] = scenarioFcnHandle();

% You can use Driving Scenario Designer to explore the scenario
% drivingScenarioDesigner(scenario)
% drivingScenarioDesigner('LKATestBenchScenario')

%% Generate data for Simulink simulation  
[driverPath,x0_ego,y0_ego,v0_ego,yaw0_ego,simStopTime] = ...
    createDriverPath(scenario,6);
%% reward variant
rewardMode = 2;
REWARD_MODE_QUADRATIC = Simulink.Variant('rewardMode ==1');
REWARD_MODE_TRIGONOMETRY = Simulink.Variant('rewardMode ==2');
%% observation variant
observationMode = 1;
OBSV_MODE_EIGHT = Simulink.Variant('observationMode ==1');
OBSV_MODE_FOUR  = Simulink.Variant('observationMode ==2');
OBSV_MODE_TWO   = Simulink.Variant('observationMode ==3');
%% Load RL Agent
% load('WorkingDDPGAgentEightStates')