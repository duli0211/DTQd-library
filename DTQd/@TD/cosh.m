function res=cosh(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

if a.complex
    error('we only consider real number now');
end

if iszero(a)
      res=TD(1.0);
      return
end

ea=exp(a);
res=Mul_pwr2(ea+inv(ea),0.5);