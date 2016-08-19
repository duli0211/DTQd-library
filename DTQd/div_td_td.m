function  c = div_td_td(a,b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

global MPLAB_TD_ACCURACY      % Check default display
  if isequal(MPLAB_TD_ACCURACY ,'accuarte') 
    c = div_acc_td_td(a,b);
  elseif  isequal(MPLAB_TD_ACCURACY ,'sloppy') 
    c = div_sloppy_td_td(a,b);
  else
      error('accurate or sloppy');
  end
  
