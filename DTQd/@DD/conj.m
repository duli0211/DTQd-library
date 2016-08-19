function c = conj(a)
%CONJ         Implements complex conjugate  conj(a)  for double-double
%
%   c = conj(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

  c = a;
  if a.complex
    c.hi= conj(a.hi);
    c.lo= conj(a.lo);
  end