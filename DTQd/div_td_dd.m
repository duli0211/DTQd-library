function  c = div_td_dd(a,b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

global MPLAB_TD_ACCURACY  MPLAB_DD_ACCURACY     % Check default display
  if isequal(MPLAB_TD_ACCURACY ,'accuarte') && isequal(MPLAB_DD_ACCURACY ,'accuarte')
    c = div_acc_td_dd(a,b);
  else 
    c = div_sloppy_td_dd(a,b);
  end
  
  %����ľ��Ȱ汾Ҫ��DD��QD�������й�ϵ��