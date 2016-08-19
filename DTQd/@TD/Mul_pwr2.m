function c = Mul_pwr2(a,b)
%  triple-double (a) * double (b),  where double (b) is a power of 2. 
%  We only use it in function ...
%  sqrt();
% written by P. B. Du & H. Jiang NUDT 07/01/2013
c=a;
c.p1=a.p1.*b;
c.p2=a.p2.*b;
c.p3=a.p3.*b;