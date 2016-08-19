function res=acos(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

qd_pi = QD(3.141592653589793116e+00, 1.224646799147353207e-16,   -2.994769809718339666e-33,  1.112454220863365282e-49);

abs_a=abs(a);
if(abs_a>1.0)
    disp('Argument out of domain.');
    res=QD(nan);
    return
end
if(isone(abs_a))
    if(a>0)
        res=QD(0);
    else
        res=qd_pi;
    end
end
res=atan2(sqrt(1.0-sqr(a)),a);