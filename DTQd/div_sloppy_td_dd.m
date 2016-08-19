function c = div_sloppy_td_dd(a,b)
% division of  triple - double  and double-double  the result is triple-double
% input  a   triple-double    but in vector form
%        b   double-double  but in vector form
% output c   triple-double    but in  vector form
% sloppy version
% written by P. B. Du & H. Jiang NUDT 07/01/2013


a=TD(a(1),a(2),a(3));
b=DD(b(1),b(2));
qd_b=TD(b);

%
q0=part1(a)/hi(b);
r=a-q0.*qd_b;

%
q1=part1(r)/hi(b);
r=r-q1.*qd_b;

%
q2=part1(r)/hi(b);



[c(1),c(2),c(3)] = quick_renorm(q0, q1, q2);

end


