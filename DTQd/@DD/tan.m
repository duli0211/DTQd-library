function res=tan(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

[s,c]=sincos(a);
if iszero(c)
    if(s>0)
        res=DD(inf);
        return
    elseif(s<0)
        res=DD(-inf);
        return
    else
        error('Both arguments zero.');
    end
end
res=s./c;