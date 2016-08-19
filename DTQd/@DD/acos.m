function res=acos(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

dd_pi = DD(3.141592653589793116e+00,1.224646799147353207e-16);

abs_a=abs(a);
if(abs_a>1.0)
    error('Argument out of domain.');
end
if(isone(abs_a))
    if(a>0)
        res=DD(0);
    else
        res=dd_pi;
    end
end
res=atan2(sqrt(1.0-sqr(a)),a);