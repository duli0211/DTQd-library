function [rh, rl] = div_sloppy_d_dd(a,bh,bl)
% division of  double  and double-double  
%  inline dd_real operator/(double a, const dd_real &b)
% in QD library  
% % define al=0 in [rh, rl] = div_sloppy_dd_dd(ah,al,bh,bl)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

q1 = a/bh;

[rh, rl] = prod_dd_d(bh, bl, q1);
[s1, s2] = TwoSum(a, -rh);
s2 = s2 - rl;


%-------get next approximation-----
q2 = (s1 + s2) / bh;

%-------------renormalize------------------------

[rh, rl] = TwoSum(q1, q2);

end

