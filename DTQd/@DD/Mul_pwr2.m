function c = Mul_pwr2(a,b)
%  double-double (a) * double (b),  where double (b) is a power of 2. 
%  QD library dd_real.cpp  dd_real exp(const dd_real &a)
%  We only use it in function exp()
% written by P. B. Du & H. Jiang NUDT 07/01/2013

c=a;
c.hi=a.hi.*b;
c.lo=a.lo.*b;



