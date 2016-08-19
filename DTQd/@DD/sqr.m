function c = sqr(a)
%SQR        Implements  a^2  , a is in double-double format  and a is real
%这个函数不是重载函数
% 
% QD library dd_inline.h  inline dd_real sqr
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%

if a.complex
    c.complex=1;
else
    c.complex=0;
end

% if a.double==1
%     c=a;
%     [c.hi,c.lo]=TwoSqr(a.hi);
% else
%     c=a;
    [p1,p2]=TwoSqr(a.hi);
    p2=p2+2.0.*a.hi.*a.lo;
    p2=p2+a.lo.*a.lo;
    [c.hi,c.lo]=FastTwoSum(p1,p2);
% end

c = class(c,'DD');
