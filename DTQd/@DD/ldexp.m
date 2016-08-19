function res = ldexp(a,b)
%LDEXP double-double * (2.0 ^ b) 
%int exp;  a.*2^b  

%
% QD library dd_inline.h inline dd_real ldexp 
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%


res=a;
res.hi=ldexp(a.hi.*b);
res.lo=ldexp(a.lo.*b);   
%ldexp 是c语言中的math.h中的函数  matlab 中没有这个函数 
% 我们还是用Mul_pwr 函数替代这个函数使用。
% 这个函数是没有用的在我们的算法中。


