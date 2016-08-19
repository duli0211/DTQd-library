function res = sin_taylor(a)
%SIN          Implements  sin(a)  for double-double
%
% QD library dd_real.cpp  dd_real sin(const dd_real &a)
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%
% /Exponential.  Computes exp(x) in double-double precision. 
% 
%   Strategy.  To compute sin(x), we choose integers a, b so that
% 
%        x = s + a * (pi/2) + b * (pi/16)
% 
%      and |s| <= pi/32.  Using the fact that 
% 
%        sin(pi/16) = 0.5 * sqrt(2 - sqrt(2 + sqrt(2)))
% 
%      we can compute sin(x) from sin(s), cos(s).  This greatly 
%      increases the convergence of the sine Taylor series. 
% 
%  常数设置   %一直不知道为什么这个数值有效位要比matlab长几位？
inv_fact(1)=DD(1.66666666666666657e-01,  9.25185853854297066e-18);
inv_fact(2)=DD(4.16666666666666644e-02,  2.31296463463574266e-18);
inv_fact(3)=DD(8.33333333333333322e-03,  1.15648231731787138e-19);
inv_fact(4)=DD(1.38888888888888894e-03, -5.30054395437357706e-20);
inv_fact(5)=DD(1.98412698412698413e-04,  1.72095582934207053e-22);
inv_fact(6)=DD(2.48015873015873016e-05,  2.15119478667758816e-23);
inv_fact(7)=DD(2.75573192239858925e-06, -1.85839327404647208e-22);
inv_fact(8)=DD(2.75573192239858883e-07,  2.37677146222502973e-23);
inv_fact(9)=DD(2.50521083854417202e-08, -1.44881407093591197e-24);
inv_fact(10)=DD(2.08767569878681002e-09, -1.20734505911325997e-25);
inv_fact(11)=DD(1.60590438368216133e-10,  1.25852945887520981e-26);
inv_fact(12)=DD(1.14707455977297245e-11,  2.06555127528307454e-28);
inv_fact(13)=DD(7.64716373181981641e-13,  7.03872877733453001e-30);
inv_fact(14)=DD(4.77947733238738525e-14,  4.39920548583408126e-31);
inv_fact(15)=DD(2.81145725434552060e-15,  1.65088427308614326e-31);

% Computes sin(a) using Taylor series.
%    Assumes |a| <= pi/32.          
thresh=0.5*abs(double(a))*double(DD('eps'));

% if a.complex
%     error('we only consider real number now');
% end

if iszero(a)
      res=DD(0);
      return
end

x=-sqr(a);
s=a;
r=a;
t=sqr(a).*a.*inv_fact(1);
i=1;
while i<16 && abs(double(t))>thresh
    r=r.*x;
    t=r.*inv_fact(i);
    s=s+t;
    i=i+2;
end

res=s;