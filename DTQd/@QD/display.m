function display(c)
%DISPLAY      Command window display of quad-double format (rigorous)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

  global MPLAB_QD_DISPLAY      % Check default display
  if isequal(MPLAB_QD_DISPLAY,'DisplayStruct')
    disp(struct(c));
  elseif isequal(MPLAB_QD_DISPLAY,'DisplayVpa')
    digits(64)                  %10^64=2^212  for quad-double we have 212bits of accuracy
    disp(vpa(sym(c)));
  else
      error('other display format');
  end


  
