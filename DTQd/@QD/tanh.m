function res=tanh(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

if a.complex
    error('we only consider real number now');
end

if iszero(a)
      res=QD(0);
      return
end

if(abs(double(a))>0.05)
   ea=exp(a);
   inv_ea=inv(ea);
   res=(ea-inv_ea)./(ea+inv_ea);
return
else
    s=sinh(a);
    c=sqrt(1+sqr(s));
    res=s./c;
    return
end