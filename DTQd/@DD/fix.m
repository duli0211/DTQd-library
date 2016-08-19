function c = fix(a)
% FIX rounds the element of a in double-double format toward zero
% QD library dd_inline.h   inline dd_real aint
% written by P. B. Du & H. Jiang NUDT 07/01/2013


if  a.complex
    ar=real(a);ai=imag(a);
    if ar.hi>=0.0
        cr=floor(ar);
    else
        cr=ceil(ar);
    end
    if ai.hi>=0.0
        ci=floor(ai);
    else
        ci=ceil(ai);
    end
    c.hi=complex(cr.hi,ci.hi);
    c.lo=complex(cr.lo,ci.lo);
else
    if a.hi>=0.0
        c=floor(a);
    else
        c=ceil(a);
    end
end


