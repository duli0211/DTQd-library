function [s,e] = div_d_d(a,b)
% division of  double  and double  the result is double-double
% inline dd_real dd_real::div(double a, double b)
% in QD library  inline dd_real dd_real::div(double a, double b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013
q1=a/b;

[p1,p2]=TwoProduct(q1,b);
[s,e]=TwoSum(a, -p1);
e=e-p2;

q2=(s+e)/b;

[s,e]=FastTwoSum(q1,q2);

end

