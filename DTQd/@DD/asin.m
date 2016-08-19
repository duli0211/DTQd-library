function res=asin(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

dd_pi2 = DD(1.570796326794896558e+00,6.123233995736766036e-17);

abs_a=abs(a);
if(abs_a>1.0)
    error('Argument out of domain.');
end
if(isone(abs_a))
    if(a>0)
        res=dd_pi2;
        return
    else
        res=-dd_pi2;
        return
    end
end
res=atan2(a,sqrt(1.0-sqr(a)));
        