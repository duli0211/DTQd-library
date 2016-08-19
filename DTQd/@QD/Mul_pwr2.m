function c = Mul_pwr2(a,b)
%  quad-double (a) * double (b),  where double (b) is a power of 2. 
%  QD library qd_inline.h  inline qd_real mul_pwr2(
%  We only use it in function ...
% sqrt();
% written by P. B. Du & H. Jiang NUDT 07/01/2013

c=a;
c.p1=a.p1.*b;
c.p2=a.p2.*b;
c.p3=a.p3.*b;
c.p4=a.p4.*b;
