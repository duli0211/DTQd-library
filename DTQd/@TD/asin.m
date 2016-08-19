function res=asin(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

td_pi2 = TD(1.570796326794896558e+00,   6.123233995736766036e-17,   -1.497384904859169833e-33);

abs_a=abs(a);
if(abs_a>1.0)
    disp('Argument out of domain.');
    res=TD(nan);
    return
end
if(isone(abs_a))
    if(a>0)
        res=td_pi2;
        return
    else
        res=-td_pi2;
        return
    end
end
res=atan2(a,sqrt(1.0-sqr(a)));
        