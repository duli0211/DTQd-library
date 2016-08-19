function [rh, rl] = div_acc_dd_dd(ah,al,bh,bl)
% division of  double-double  and double-double
% inline dd_real dd_real::accurate_div(const dd_real &a, const dd_real &b)
% in QD library
% written by P. B. Du & H. Jiang & B. Robert 18/04/2012  zaragoza
q1=ah/bh;
[th,tl]=prod_dd_d (bh,bl,q1);
[rh,rl]=add_dd_dd (ah, al, -th,-tl);

q2=rh/bh;
[th,tl]=prod_dd_d(bh,bl,q2);
[rh,rl]=add_dd_dd (rh, rl, -th,-tl);

q3=rh/bh;

[q1, q2] = FastTwoSum(q1, q2);
[rh, rl] = add_dd_d (q1, q2, q3);
end

