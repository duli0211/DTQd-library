function [rh, rl] = div_acc_d_dd(a,bh,bl)
% division of  double  and double-double
% in QD library inline dd_real operator/(double a, const dd_real &b)
% define al=0 in div_dd_dd(ah,al,bh,bl)
% written by P. B. Du & H. Jiang & B. Robert 18/04/2012  zaragoza
q1=a/bh;
[th,tl]=prod_dd_d (bh,bl,q1);
[rh,rl]=add_dd_d (-th,-tl,a);

q2=rh/bh;
[th,tl]=prod_dd_d(bh,bl,q2);
[rh,rl]=add_dd_dd (rh, rl, -th,-tl);

q3=rh/bh;

[q1, q2] = FastTwoSum(q1, q2);
[rh, rl] = add_dd_d (q1, q2, q3);
end
