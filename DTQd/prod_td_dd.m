function c= prod_td_dd(a,b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

global MPLAB_TD_ACCURACY       % Check default display
  if isequal(MPLAB_TD_ACCURACY ,'accuarte')
    c= prod_acc_td_dd(a,b);
  elseif isequal(MPLAB_TD_ACCURACY ,'sloppy')
    c= prod_sloppy_td_dd(a,b);
  else
      error('sloppy or accurate');
  end
