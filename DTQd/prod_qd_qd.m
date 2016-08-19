function  c= prod_qd_qd(a,b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

global MPLAB_QD_ACCURACY       % Check default display
  if isequal(MPLAB_QD_ACCURACY ,'accuarte')
    c= prod_acc_qd_qd(a,b);
  elseif isequal(MPLAB_QD_ACCURACY ,'sloppy')
    c= prod_sloppy_qd_qd(a,b);
  else
      error('sloppy or accurate');
  end