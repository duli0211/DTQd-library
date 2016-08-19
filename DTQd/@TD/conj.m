function c = conj(a)
%CONJ         Implements complex conjugate  conj(a)  for triple-double
%
% c = conj(a)
% a is in triple-double format
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013

  c = a;
  if a.complex
    c.p1= conj(a.p1);
    c.p2= conj(a.p2);
    c.p3= conj(a.p3);
  end