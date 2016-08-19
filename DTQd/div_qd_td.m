function  c = div_qd_td(a,b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

global MPLAB_TD_ACCURACY  MPLAB_QD_ACCURACY      % Check default display
  if isequal(MPLAB_TD_ACCURACY ,'accuarte') && isequal(MPLAB_QD_ACCURACY ,'accuarte') 
    c = div_acc_qd_td(a,b);
  elseif  isequal(MPLAB_TD_ACCURACY ,'sloppy') && isequal(MPLAB_QD_ACCURACY ,'sloppy') 
    c = div_sloppy_qd_td(a,b);
  else
      error('QD and TD has better the same format for accurate or sloppy');
  end