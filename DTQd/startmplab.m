function startmplab
%STARTINTLAB  Initialization of paths, global variables etc.
%             Adapt this to your local needs
%

% written  27/12/2012   H.Jiang  NUDT
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Default setting:  please change these lines to your needs %%
%VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV

% MPAVN  directory

% Defines INTLABPATH to be the directory, in which this file "startintlab" is contained
  dir_startintlab = which('startintlab');
  INTLABPATH = dir_startintlab(1:end-13);


% If INTLAB is contained in another directory, please uncomment and adapt this line
% INTLABPATH = 'C:\INTLAB VERSIONS\INTLAB\';           % blanks allowed 


%AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%% add new paths
 
%   wng = warning;          % supress warning that "format" is overloaded
%   warning off
  addpath(  INTLABPATH   )        %             , ...
%           [ INTLABPATH 'DTQd' ]                , ...
%            [ INTLABPATH 'gradient' ]            , ...
%            [ INTLABPATH 'hessian' ]             , ...
%            [ INTLABPATH 'taylor' ]              , ...
%            [ INTLABPATH 'slope' ]               , ...
%            [ INTLABPATH 'polynom' ]             , ...
%            [ INTLABPATH 'utility' ]             , ...
%            [ INTLABPATH 'long' ]                , ...
%            [ INTLABPATH 'accsumdot' ]           , ...
%            [ INTLABPATH 'demos' ]
        
  path(path)			              % make sure paths are correct
	  
  DDinit;
  TDinit;
  QDinit;
  
  % works in all Matlab versions
%   warning(wng);

%%%%%%%%%% set INTLAB environment
% 
%   format compact
%   format short
%   try
%     feature jit off                % avoid change of code
%   end
%   try
%     feature accel off		    
%   end
% 
% 
% %%%%%%%%%% initialize sparse systems
% 
%   spparms('autoamd',0);            % switch off automatic band reduction
%   spparms('autommd',0);            % ( switching on may slow down sparse
%                                    %   computations significantly )
% 
% 
% %%%%%%%%%% initialize interval toolbox (see "help intvalinit")
% 
%   intvalinit('Init',1,INTLABPATH)  % Initialize global constants
% 
% 
% %%%%%%%%%% initialize gradient toolbox
% 
%   gradientinit
% 
% 
% %%%%%%%%%% initialize Hessian toolbox
% 
%   hessianinit
% 
% 
% %%%%%%%%%% initialize slope toolbox
% 
%   slopeinit
% 
% 
% %%%%%%%%%% initialize long toolbox
% 
%   longinit('Init')
% 
% 
% %%%%%%%%%% initialize polynom toolbox
% 
%   polynominit('Init')
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%  Default setting:  change these lines to your needs   %%%%%%%%%%%%%%
% %VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
% 
%   displaywidth(120);               % width of output
% 
%   intvalinit('Display_')
%   intvalinit('RealStdFctsExcptnWarn')
%   intvalinit('ImprovedResidual')
%   intvalinit('LssFirstSecondStage')
%   intvalinit('FastIVMult')
%   intvalinit('RealComplexAssignAuto')
%   intvalinit('ComplexInfSupAssignWarn')
% 
%   longinit('WithErrorTerm')
% 
%   polynominit('DisplayUPolySparse')
%   polynominit('EvaluateUPolyHorner')
%   polynominit('EvaluateMPolyPower')
%   polynominit('AccessVariableWarn')
% 
%   slopeinit('SlopeSparseArrayDerivWarn')
% 
%   sparsegradient(50);     % Gradients stored sparse for fifty and more variables
%   gradientinit('GradientSparseArrayDerivWarn')
% 
%   sparsehessian(10);      % Hessians stored sparse for ten and more variables
%   hessianinit('HessianSparseArrayDerivWarn')
% 
% %AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%   intvalinit('license')
%   intlablogo([0:4:32 32:-4:24 24:4:32])
%   pause(0.5)
%   close
%   
%   
% %%%%%%%%%% store current setting as default setting
%   
%   intvalinit('StoreDefaultSetting')
  
  
%%%%%%%%%% set working environment

%setround(0)             % set rounding to nearest

% uncomment and adapt this statement if necessary
% cd('c:\rump\matlab\work')
  