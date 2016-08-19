function  c = div_qd_qd(a,b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

global MPLAB_QD_ACCURACY       % Check default display
  if isequal(MPLAB_QD_ACCURACY ,'accuarte')
    c = div_acc_qd_qd(a,b);
  elseif isequal(MPLAB_QD_ACCURACY ,'sloppy')
    c = div_sloppy_qd_qd(a,b);
  else
    error('sloppy or accurate');
  end

  
  % 数值试验显示acc版本和sloppy版本结果一样
  % 但是没有进行大规模的数值计算验证原因 2013年01月07日