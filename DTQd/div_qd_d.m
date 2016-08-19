function  c = div_qd_d(a,b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

global MPLAB_QD_ACCURACY     % Check default display
  if isequal(MPLAB_QD_ACCURACY ,'accuarte') 
    c = div_acc_qd_d(a,b);
  else 
    c = div_sloppy_qd_d(a,b);
  end
  

