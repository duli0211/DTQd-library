function  [rh, rl] = div_dd_dd(ah,al,bh,bl)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

global MPLAB_DD_ACCURACY       % Check default display
  if isequal(MPLAB_DD_ACCURACY ,'accuarte')
    [rh, rl] = div_acc_dd_dd(ah,al,bh,bl);
  elseif isequal(MPLAB_DD_ACCURACY ,'sloppy')
    [rh, rl] = div_sloppy_dd_dd(ah,al,bh,bl);
  else
      error('sloppy or accurate');
  end