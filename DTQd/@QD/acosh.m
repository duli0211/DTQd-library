function res=acosh(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

if(a<1.0)
    disp('Argument out of domain.');
    res=QD(nan);
    return
end

res=log(a+sqrt(sqr(a)-1.0));