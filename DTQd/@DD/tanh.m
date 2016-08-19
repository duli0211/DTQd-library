function res=tanh(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

if a.complex
    error('we only consider real number now');
end

if iszero(a)
      res=DD(0);
      return
end

ea=exp(a);
inv_ea=inv(ea);
res=(ea-inv_ea)./(ea+inv_ea);