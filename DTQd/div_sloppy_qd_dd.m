function c = div_sloppy_qd_dd(a,b)
% division of  quad - double  and double-double  the result is quad-double
% inline dd_real dd_real::div(double a, double b)
% in QD library  qd_real.cpp  qd_real qd_real::sloppy_div(const qd_real &a, const dd_real &b)
% input  a   quad-double    but in vector form
%        b   double-double  but in vector form
% output c   quad-double    but in vector form
% written by P. B. Du & H. Jiang NUDT 07/01/2013


a=QD(a(1),a(2),a(3),a(4));
b=DD(b(1),b(2));
qd_b=QD(b);

%
q0=part1(a)/hi(b);
r=a-q0.*qd_b;

%
q1=part1(r)/hi(b);
r=r-q1.*qd_b;

%
q2=part1(r)/hi(b);
r=r-q2.*qd_b;

%
q3=part1(r)/hi(b);

%
[c(1),c(2),c(3),c(4)] = quick_renorm(q0, q1, q2, q3);

end
