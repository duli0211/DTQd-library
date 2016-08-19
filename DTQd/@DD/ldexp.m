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
%ldexp ��c�����е�math.h�еĺ���  matlab ��û��������� 
% ���ǻ�����Mul_pwr ��������������ʹ�á�
% ���������û���õ������ǵ��㷨�С�


