function [BusLaneBoundaries1,BusLaneBoundaries1LaneBoundaries] = BusLaneBoundSetup(MaxNumLaneBound)
% -------------------------------------------------------------------
%  Generated by MATLAB on 5-Mar-2021 10:33:51
%  MATLAB version: 9.10.0.1588741 (R2021a)
% -------------------------------------------------------------------
                                           

BusLaneBoundaries1 = Simulink.Bus;
BusLaneBoundaries1.Description = '';
BusLaneBoundaries1.DataScope = 'Auto';
BusLaneBoundaries1.HeaderFile = '';
BusLaneBoundaries1.Alignment = -1;
% BusLaneBoundaries1.PreserveElementDimensions = false;
saveVarsTmp{1} = Simulink.BusElement;
saveVarsTmp{1}.Name = 'NumLaneBoundaries';
saveVarsTmp{1}.Complexity = 'real';
saveVarsTmp{1}.Dimensions = [1 1];
saveVarsTmp{1}.DataType = 'double';
saveVarsTmp{1}.Min = [];
saveVarsTmp{1}.Max = [];
saveVarsTmp{1}.DimensionsMode = 'Fixed';
saveVarsTmp{1}.SamplingMode = 'Sample based';
saveVarsTmp{1}.DocUnits = '';
saveVarsTmp{1}.Description = '';
saveVarsTmp{1}(2, 1) = Simulink.BusElement;
saveVarsTmp{1}(2, 1).Name = 'Time';
saveVarsTmp{1}(2, 1).Complexity = 'real';
saveVarsTmp{1}(2, 1).Dimensions = [1 1];
saveVarsTmp{1}(2, 1).DataType = 'double';
saveVarsTmp{1}(2, 1).Min = [];
saveVarsTmp{1}(2, 1).Max = [];
saveVarsTmp{1}(2, 1).DimensionsMode = 'Fixed';
saveVarsTmp{1}(2, 1).SamplingMode = 'Sample based';
saveVarsTmp{1}(2, 1).DocUnits = '';
saveVarsTmp{1}(2, 1).Description = '';
saveVarsTmp{1}(3, 1) = Simulink.BusElement;
saveVarsTmp{1}(3, 1).Name = 'LaneBoundaries';
saveVarsTmp{1}(3, 1).Complexity = 'real';
saveVarsTmp{1}(3, 1).Dimensions = [MaxNumLaneBound 1];
saveVarsTmp{1}(3, 1).DataType = 'Bus: BusLaneBoundaries1LaneBoundaries';
saveVarsTmp{1}(3, 1).Min = [];
saveVarsTmp{1}(3, 1).Max = [];
saveVarsTmp{1}(3, 1).DimensionsMode = 'Fixed';
saveVarsTmp{1}(3, 1).SamplingMode = 'Sample based';
saveVarsTmp{1}(3, 1).DocUnits = '';
saveVarsTmp{1}(3, 1).Description = '';
BusLaneBoundaries1.Elements = saveVarsTmp{1};
clear saveVarsTmp;

BusLaneBoundaries1LaneBoundaries = Simulink.Bus;
BusLaneBoundaries1LaneBoundaries.Description = '';
BusLaneBoundaries1LaneBoundaries.DataScope = 'Auto';
BusLaneBoundaries1LaneBoundaries.HeaderFile = '';
BusLaneBoundaries1LaneBoundaries.Alignment = -1;
% BusLaneBoundaries1LaneBoundaries.PreserveElementDimensions = false;
saveVarsTmp{1} = Simulink.BusElement;
saveVarsTmp{1}.Name = 'Coordinates';
saveVarsTmp{1}.Complexity = 'real';
saveVarsTmp{1}.Dimensions = [121 3];
saveVarsTmp{1}.DataType = 'double';
saveVarsTmp{1}.Min = [];
saveVarsTmp{1}.Max = [];
saveVarsTmp{1}.DimensionsMode = 'Fixed';
saveVarsTmp{1}.SamplingMode = 'Sample based';
saveVarsTmp{1}.DocUnits = '';
saveVarsTmp{1}.Description = '';
saveVarsTmp{1}(2, 1) = Simulink.BusElement;
saveVarsTmp{1}(2, 1).Name = 'Curvature';
saveVarsTmp{1}(2, 1).Complexity = 'real';
saveVarsTmp{1}(2, 1).Dimensions = [121 1];
saveVarsTmp{1}(2, 1).DataType = 'double';
saveVarsTmp{1}(2, 1).Min = [];
saveVarsTmp{1}(2, 1).Max = [];
saveVarsTmp{1}(2, 1).DimensionsMode = 'Fixed';
saveVarsTmp{1}(2, 1).SamplingMode = 'Sample based';
saveVarsTmp{1}(2, 1).DocUnits = '';
saveVarsTmp{1}(2, 1).Description = '';
saveVarsTmp{1}(3, 1) = Simulink.BusElement;
saveVarsTmp{1}(3, 1).Name = 'CurvatureDerivative';
saveVarsTmp{1}(3, 1).Complexity = 'real';
saveVarsTmp{1}(3, 1).Dimensions = [121 1];
saveVarsTmp{1}(3, 1).DataType = 'double';
saveVarsTmp{1}(3, 1).Min = [];
saveVarsTmp{1}(3, 1).Max = [];
saveVarsTmp{1}(3, 1).DimensionsMode = 'Fixed';
saveVarsTmp{1}(3, 1).SamplingMode = 'Sample based';
saveVarsTmp{1}(3, 1).DocUnits = '';
saveVarsTmp{1}(3, 1).Description = '';
saveVarsTmp{1}(4, 1) = Simulink.BusElement;
saveVarsTmp{1}(4, 1).Name = 'HeadingAngle';
saveVarsTmp{1}(4, 1).Complexity = 'real';
saveVarsTmp{1}(4, 1).Dimensions = [1 1];
saveVarsTmp{1}(4, 1).DataType = 'double';
saveVarsTmp{1}(4, 1).Min = [];
saveVarsTmp{1}(4, 1).Max = [];
saveVarsTmp{1}(4, 1).DimensionsMode = 'Fixed';
saveVarsTmp{1}(4, 1).SamplingMode = 'Sample based';
saveVarsTmp{1}(4, 1).DocUnits = '';
saveVarsTmp{1}(4, 1).Description = '';
saveVarsTmp{1}(5, 1) = Simulink.BusElement;
saveVarsTmp{1}(5, 1).Name = 'LateralOffset';
saveVarsTmp{1}(5, 1).Complexity = 'real';
saveVarsTmp{1}(5, 1).Dimensions = [1 1];
saveVarsTmp{1}(5, 1).DataType = 'double';
saveVarsTmp{1}(5, 1).Min = [];
saveVarsTmp{1}(5, 1).Max = [];
saveVarsTmp{1}(5, 1).DimensionsMode = 'Fixed';
saveVarsTmp{1}(5, 1).SamplingMode = 'Sample based';
saveVarsTmp{1}(5, 1).DocUnits = '';
saveVarsTmp{1}(5, 1).Description = '';
saveVarsTmp{1}(6, 1) = Simulink.BusElement;
saveVarsTmp{1}(6, 1).Name = 'BoundaryType';
saveVarsTmp{1}(6, 1).Complexity = 'real';
saveVarsTmp{1}(6, 1).Dimensions = [1 1];
saveVarsTmp{1}(6, 1).DataType = 'uint8';
saveVarsTmp{1}(6, 1).Min = [];
saveVarsTmp{1}(6, 1).Max = [];
saveVarsTmp{1}(6, 1).DimensionsMode = 'Fixed';
saveVarsTmp{1}(6, 1).SamplingMode = 'Sample based';
saveVarsTmp{1}(6, 1).DocUnits = '';
saveVarsTmp{1}(6, 1).Description = '';
saveVarsTmp{1}(7, 1) = Simulink.BusElement;
saveVarsTmp{1}(7, 1).Name = 'Strength';
saveVarsTmp{1}(7, 1).Complexity = 'real';
saveVarsTmp{1}(7, 1).Dimensions = [1 1];
saveVarsTmp{1}(7, 1).DataType = 'double';
saveVarsTmp{1}(7, 1).Min = [];
saveVarsTmp{1}(7, 1).Max = [];
saveVarsTmp{1}(7, 1).DimensionsMode = 'Fixed';
saveVarsTmp{1}(7, 1).SamplingMode = 'Sample based';
saveVarsTmp{1}(7, 1).DocUnits = '';
saveVarsTmp{1}(7, 1).Description = '';
saveVarsTmp{1}(8, 1) = Simulink.BusElement;
saveVarsTmp{1}(8, 1).Name = 'Width';
saveVarsTmp{1}(8, 1).Complexity = 'real';
saveVarsTmp{1}(8, 1).Dimensions = [1 1];
saveVarsTmp{1}(8, 1).DataType = 'double';
saveVarsTmp{1}(8, 1).Min = [];
saveVarsTmp{1}(8, 1).Max = [];
saveVarsTmp{1}(8, 1).DimensionsMode = 'Fixed';
saveVarsTmp{1}(8, 1).SamplingMode = 'Sample based';
saveVarsTmp{1}(8, 1).DocUnits = '';
saveVarsTmp{1}(8, 1).Description = '';
saveVarsTmp{1}(9, 1) = Simulink.BusElement;
saveVarsTmp{1}(9, 1).Name = 'Length';
saveVarsTmp{1}(9, 1).Complexity = 'real';
saveVarsTmp{1}(9, 1).Dimensions = [1 1];
saveVarsTmp{1}(9, 1).DataType = 'double';
saveVarsTmp{1}(9, 1).Min = [];
saveVarsTmp{1}(9, 1).Max = [];
saveVarsTmp{1}(9, 1).DimensionsMode = 'Fixed';
saveVarsTmp{1}(9, 1).SamplingMode = 'Sample based';
saveVarsTmp{1}(9, 1).DocUnits = '';
saveVarsTmp{1}(9, 1).Description = '';
saveVarsTmp{1}(10, 1) = Simulink.BusElement;
saveVarsTmp{1}(10, 1).Name = 'Space';
saveVarsTmp{1}(10, 1).Complexity = 'real';
saveVarsTmp{1}(10, 1).Dimensions = [1 1];
saveVarsTmp{1}(10, 1).DataType = 'double';
saveVarsTmp{1}(10, 1).Min = [];
saveVarsTmp{1}(10, 1).Max = [];
saveVarsTmp{1}(10, 1).DimensionsMode = 'Fixed';
saveVarsTmp{1}(10, 1).SamplingMode = 'Sample based';
saveVarsTmp{1}(10, 1).DocUnits = '';
saveVarsTmp{1}(10, 1).Description = '';
BusLaneBoundaries1LaneBoundaries.Elements = saveVarsTmp{1};
clear saveVarsTmp;

