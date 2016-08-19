function display(c)
%DISPLAY      Command window display of triple-double format (rigorous)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

  global MPLAB_TD_DISPLAY      % Check default display
  if isequal(MPLAB_TD_DISPLAY,'DisplayStruct')
    disp(struct(c));
  elseif isequal(MPLAB_TD_DISPLAY,'DisplayVpa')
    digits(48)                  %10^48=2^159  for quad-double we have 159 banary bits of accuracy
    disp(vpa(sym(c)));
  else
      error('other display format');
  end
