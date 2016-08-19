function res=asin(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

qd_pi2 = QD(1.570796326794896558e+00,   6.123233995736766036e-17,   -1.497384904859169833e-33,   5.562271104316826408e-50);

abs_a=abs(a);
if(abs_a>1.0)
    disp('Argument out of domain.');
    res=QD(nan);
    return
end
if(isone(abs_a))
    if(a>0)
        res=qd_pi2;
        return
    else
        res=-qd_pi2;
        return
    end
end
res=atan2(a,sqrt(1.0-sqr(a)));
        