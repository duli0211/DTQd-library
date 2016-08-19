function c = div_acc_td_td(a,b)
% division of  triple - double  and triple-double  the result is triple-double
% input  a   triple-double    but in vector form
%        b   triple-double    but in vector form
% output c   triple-double    but in  vector form
% accurate version
% written by P. B. Du & H. Jiang NUDT 07/01/2013

a=TD(a(1),a(2),a(3));
b=TD(b(1),b(2),b(3));

%
q0=part1(a)/part1(b);
r=a-q0.*b;

%
q1=part1(r)/part1(b);
r=r-q1.*b;

%
q2=part1(r)/part1(b);
r=r-q2.*b;

%
q3=part1(r)/part1(b);


%
[c(1),c(2),c(3)] = quick_renorm(q0, q1, q2, q3);

end

