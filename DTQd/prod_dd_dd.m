function [rh, rl]= prod_dd_dd(ah, al,bh,bl)
%À´Ô´£ºAccurate Floating-Point Product and Exponentiation Stef Graillat IEEE
%TRANSACTIONS ON COMPUTERS, VOL. 58, NO. 7, JULY 2009
%QD library dd_inline.h 
% double-double * double-double
% inline dd_real operator*(const dd_real &a, const dd_real &b) 
% written by P. B. Du & H. Jiang NUDT 07/01/2013


[t1,t2]=TwoProduct(ah,bh);
t3=(ah*bl)+(al*bh)+t2;
[rh,rl]=FastTwoSum(t1,t3);     % in the paper of Stef TwoSum is used but in QD library FastTwoSum is used


