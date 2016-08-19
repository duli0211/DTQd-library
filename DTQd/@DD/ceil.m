function c = ceil(a)
% Ceil   rounds the element of a to the nearest integers greater than or
% equal to a in double-double format
% QD library dd_inline.h   inline dd_real ceil
% written by P. B. Du & H. Jiang NUDT 07/01/2013
c=a;                     %initial
c.hi= ceil(a.hi);
c.lo=0;


if a.complex
    ar=real(a);ai=imag(a);
    cr=ceil(ar);                    % 调用自身函数
    ci=ceil(ai);
    c.hi=complex(cr.hi,ci.hi);
    c.lo=complex(cr.lo,ci.lo);
else
    if  c.hi==a.hi
        c.lo=ceil(a.lo);
        [c.hi,c.lo]=FastTwoSum(c.hi,c.lo);
    end
end


