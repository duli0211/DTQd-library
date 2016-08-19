function [s,c]=sincosh(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

if(abs(double(a))<=0.05)
    s=sinh(a);
    c=sqrt(1+sqr(s));
    return
else
    ea=exp(a);
    inv_ea=inv(ea);
    s=mul_pwr2(ea-inv_ea,0.5);
    c=mul_pwr2(ea+inv_ea,0.5);
    return
end