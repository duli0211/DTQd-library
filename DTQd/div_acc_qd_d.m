function c = div_acc_qd_d(a,b)
% division of  quad - double  and double  the result is double-double
% inline dd_real dd_real::div(double a, double b)
% in QD library  qd_real.cpp  qd_real operator/(const qd_real &a, double b)
%      Strategy:  compute approximate quotient using high order
%      doubles, and then correct it 3 times using the remainder.
%      (Analogous to long division.)
% input  a   quad-double  but in vector form
%        b   double
% output c   quad-double  but in vector form
% written by P. B. Du & H. Jiang NUDT 07/01/2013  

if ~isa(b,'double')
    error('wrong  b has to be in double format');
end

%  approximate quotient 
q0=a(1)/b;

% Compute the remainder  a - q0 * b 
[t0,t1]=TwoProduct(q0,b);
r=QD(a)-DD(t0,t1);            % r is in quad-format   change a into quad-double format  

% Compute the first correction 
q1=part1(r)/b;
[t0,t1]=TwoProduct(q1,b);
r=r-DD(t0,t1);                % using  minus in quad double format

% Second correction to the quotient.

q2=part1(r)/b;
[t0,t1]=TwoProduct(q2,b);
r=r-DD(t0,t1);  

% Second correction to the quotient.
q3=part1(r)/b;
[t0,t1]=TwoProduct(q3,b);
r=r-DD(t0,t1); 

% Final correction to the quotient. 

 q4 = part1(r)/ b;

[c(1),c(2),c(3),c(4)] = quick_renorm(q0, q1, q2, q3, q4);

end
