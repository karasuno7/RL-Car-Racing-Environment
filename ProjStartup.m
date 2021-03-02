
project = simulinkproject;
projectRoot = project.RootFolder;
 
myCacheFolder = fullfile(projectRoot, 'work');
myCodeFolder = fullfile(projectRoot, 'code');
 
Simulink.fileGenControl('set',...
    'CacheFolder', myCacheFolder,...
    'CodeGenFolder', myCodeFolder,...
    'createDir', true)