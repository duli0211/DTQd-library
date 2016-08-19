function c = imag(a)
%IMAG         Implements  imag(a)  for qtriple-double
%
%c = imag(a)
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%

  c = a;
  c.complex = 0;
  c.p1 = imag(a.p1);
  c.p2 = imag(a.p2);
  c.p3 = imag(a.p3);
