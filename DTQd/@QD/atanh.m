function res=atanh(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

if(abs(a)>=1.0)
    disp('Argument out of domain.');
    res=QD(nan);
    return
end

res=Mul_pwr2(log((1.0+a)./(1.0-a)),0.5);