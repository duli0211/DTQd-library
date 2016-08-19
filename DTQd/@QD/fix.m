function c = fix(a)
% FIX rounds the element of a in quad-double format toward zero
% QD library qd_inline.h   inline qd_real aint
% written by P. B. Du & H. Jiang NUDT 07/01/2013


if  a.complex
    ar=real(a);ai=imag(a);
    if ar.p1>=0.0
        cr=floor(ar);
    else
        cr=ceil(ar);
    end
    if ai.p1>=0.0
        ci=floor(ai);
    else
        ci=ceil(ai);
    end
    c.p1=complex(cr.p1,ci.p1);
    c.p2=complex(cr.p2,ci.p2);
    c.p3=complex(cr.p3,ci.p3);
    c.p4=complex(cr.p4,ci.p4);
else
    if a.p1>=0.0
        c=floor(a);
    else
        c=ceil(a);
    end
end




