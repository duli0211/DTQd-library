function [rh, rl] = div_sloppy_dd_dd(ah,al,bh,bl)
% division of  double-double  and double-double  
% inline dd_real dd_real::accurate_div(const dd_real &a, const dd_real &b)
% in QD library   inline dd_real dd_real::sloppy_div(const dd_real &a, const dd_real &b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

q1 = ah/bh;

[rh, rl] = prod_dd_d(bh, bl, q1);
[s1, s2] = TwoSum(ah, -rh);
s2 = s2 - rl;
s2 = s2 + al;

%-------get next approximation-----
q2 = (s1 + s2) / bh;

%-------------renormalize------------------------

[rh, rl] = TwoSum(q1, q2);

end


