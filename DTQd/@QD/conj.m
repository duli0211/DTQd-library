function c = conj(a)
%CONJ         Implements complex conjugate  conj(a)  for quad-double
%
%   c = conj(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

  c = a;
  if a.complex
    c.p1= conj(a.p1);
    c.p2= conj(a.p2);
    c.p3= conj(a.p3);
    c.p4= conj(a.p4);
  end

