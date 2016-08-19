function c = div_sloppy_qd_td(a,b)
% division of  quad - double  and triple-double  the result is triple-double
% input  a   quad-double    but in vector form
%        b   triple-double  but in vector form
% output c   quad-double    but in vector form
% sloppy version
% written by P. B. Du & H. Jiang NUDT 07/01/2013


a=QD(a(1),a(2),a(3),a(4));
b=TD(b(1),b(2),b(3));
qd_b=QD(b);

%
q0=part1(a)/part1(b);
r=a-q0.*qd_b;

%
q1=part1(r)/part1(b);
r=r-q1.*qd_b;

%
q2=part1(r)/part1(b);
r=r-q2.*qd_b;

%
q3=part1(r)/part1(b);

%
[c(1),c(2),c(3),c(4)] = quick_renorm(q0, q1, q2, q3);

end
