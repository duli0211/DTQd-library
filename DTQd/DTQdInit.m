function  DTQdInit( disptype, accuracy )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% 
% isa(disptype,'char')
% written by P. B. Du & H. Jiang NUDT 07/01/2013


 global MPLAB_DD_DISPLAY      % default display
 global MPLAB_TD_DISPLAY      % default display
 global MPLAB_QD_DISPLAY      % default display
switch lower(disptype)
    case 'toget'
       
        MPLAB_DD_DISPLAY ='DisplayVpa';
        
        MPLAB_TD_DISPLAY ='DisplayVpa';
       
        MPLAB_QD_DISPLAY ='DisplayVpa';

        disp('display is Vpa'); 

    case 'apart'
        
        MPLAB_DD_DISPLAY ='DisplayStruct';

        MPLAB_TD_DISPLAY ='DisplayStruct';

        MPLAB_QD_DISPLAY ='DisplayStruct';

        disp('display is Struct');
    otherwise
        error ('vpa or struct type');
end

 global MPLAB_QD_ACCURACY      % default display
 global MPLAB_TD_ACCURACY      % default display
 global MPLAB_DD_ACCURACY      % default display
 
 switch lower(accuracy)
    case 'accurate'     
          
        MPLAB_DD_ACCURACY ='accuarte';      
        
        MPLAB_TD_ACCURACY ='accuarte';
       
        MPLAB_QD_ACCURACY ='accuarte';
        
        disp('accurate version');

    case 'sloppy'
        
        MPLAB_DD_ACCURACY ='sloppy';
        
        MPLAB_TD_ACCURACY ='sloppy';

        MPLAB_QD_ACCURACY ='sloppy';
        
        disp('sloppy version');
        
    otherwise
        error ('acc or sloppy type');
end
 

