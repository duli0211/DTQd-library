function c = real(a)
%REAL         Real part of double-double
%
%   c = real(a)
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%

  c = a;
  c.complex = 0;
  c.hi = real(a.hi);
  c.lo = real(a.lo);

