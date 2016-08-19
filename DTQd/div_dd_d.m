function [rh, rl] = div_dd_d(ah,al,b)
% division of  double-double  and double
% in QD library /    dd_inline.h   /  inline dd_real operator/(const dd_real &a, double b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

q1=ah/b;                  % approximate quotient

[p1,p2]=TwoProduct(q1,b);
[s,e]=TwoSum(ah, -p1);
e=e+al;
e=e-p2;

%-------------get next approximation-------------
q2 = (s + e) / b;
%-------------renormalize------------------------

[rh,rl]=TwoSum(q1, q2);

end

