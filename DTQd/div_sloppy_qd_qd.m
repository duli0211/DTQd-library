function c = div_sloppy_qd_qd(a,b)
% division of  quad - double  and quad-double  the result is double-double
% inline dd_real dd_real::div(double a, double b)
% in QD library  qd_real.cpp  qd_real::sloppy_div(const qd_real &a, const qd_real &b)
% input  a   quad-double    but in matrix form
%        b   quad-double  but in matrix form
% output c   quad-double    but in matrix form
% written by P. B. Du & H. Jiang  25/12/2012  NUDT
% �����ͳ˷��ӷ���һ��������ҪӦ�ó˷��ͼӷ������㣬���ӷ��ͳ˷�����ȫ���������仯�Ϳ�����Ƶġ�

% Div_d_qd(a,b) and  Div_dd_qd(a,b) �������  Div_qd_qd(a,b) �����Ǳ�����һ����

a=QD(a(1),a(2),a(3),a(4));
b=QD(b(1),b(2),b(3),b(4));


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
[c(1),c(2),c(3),c(4)] = quick_renorm(q0, q1, q2, q3);

end

