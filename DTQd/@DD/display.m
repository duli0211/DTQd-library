function display(c)
%DISPLAY      Command window display of double-double format (rigorous)
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013

  global MPLAB_DD_DISPLAY      % Check default display
  if isequal(MPLAB_DD_DISPLAY,'DisplayStruct')
    disp(struct(c));
  elseif isequal(MPLAB_DD_DISPLAY,'DisplayVpa')
    digits(32)                  %10^2=2^106  for quad-double we have 106 bits of accuracy
    disp(vpa(sym(c)));
  else
      error('other display format');
  end




  
