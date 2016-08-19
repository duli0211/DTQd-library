function c = imag(a)
%IMAG         Implements  imag(a)  for double-double
%
%c = imag(a)
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%

  c = a;
  c.complex = 0;
  c.hi = imag(a.hi);
  c.lo = imag(a.lo);



