function c = floor(a)
% FLOOR   rounds the element of a to the nearest integers less than or equal to a in double double format. 
% QD library dd_inline.h   inline dd_real floor
% written by P. B. Du & H. Jiang NUDT 07/01/2013
c=a;                     %initial
c.hi= floor(a.hi);       % a is complex is also work here
c.lo=0;

if a.complex
    ar=real(a);ai=imag(a);
    cr=floor(ar);                    % 调用自身函数
    ci=floor(ai);
    c.hi=complex(cr.hi,ci.hi);
    c.lo=complex(cr.lo,ci.lo);
else
    if c.hi==a.hi
        c.lo=floor(a.lo);
        [c.hi,c.lo]=FastTwoSum(c.hi,c.lo);
    end
end






