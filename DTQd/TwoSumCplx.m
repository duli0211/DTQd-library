function [s,e]=TwoSumCplx(x,y)
% two complex numbers addition.
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% Stef Graillat Compensated complex Horner method
% x=a+bi; y=c+di;

% in mtimes.m and plus.m, we do not use this code
a=real(x);b=imag(x);
c=real(y);d=imag(y);
[s1,e1]=TwoSum(a,c);[s2,e2]=TwoSum(b,d);
s=complex(s1,s2);e=complex(e1,e2);


