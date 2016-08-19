function c = real(a)
%REAL         Real part of quad-double
%
%   c = real(a)
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%

  c = a;
  c.complex = 0;
  c.p1 = real(a.p1);
  c.p2 = real(a.p2);
  c.p3 = real(a.p3);
  c.p4 = real(a.p4);
