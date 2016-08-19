function res=acos(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

td_pi = TD(3.141592653589793116e+00, 1.224646799147353207e-16,   -2.994769809718339666e-33);

abs_a=abs(a);
if(abs_a>1.0)
    disp('Argument out of domain.');
    res=TD(nan);
    return
end
if(isone(abs_a))
    if(a>0)
        res=TD(0);
    else
        res=td_pi;
    end
end
res=atan2(sqrt(1.0-sqr(a)),a);