function c= prod_sloppy_qd_dd(a,b)
%qd *dd
%input :a= [a0 a1 a2 a3]; b=[ b0 b1];
%output: c= [c0 c1 c2 c3];
%/* quad-double * double-double */
%/* a0 * b0                        0
%        a0 * b1                   1
%         a1 * b0                   2
%              a1 * b1              3
%              a2 * b0              4
%                   a2 * b1         5
%                   a3 * b0         6
%                        a3 * b1    7 */
% QD library qd_inline.h  inline qd_real operator*(const qd_real &a, const dd_real &b) 
% written by P. B. Du & H. Jiang NUDT 07/01/2013



[p0,q0]=TwoProduct(a(1),b(1));
[p1,q1]=TwoProduct(a(1),b(2));
[p2,q2]=TwoProduct(a(2),b(1));
[p3,q3]=TwoProduct(a(2),b(2));
[p4,q4]=TwoProduct(a(3),b(1));

[p1,p2,q0]=ThreeSums(p1,p2,q0);

%   Five-Three-Sum


[p2,p3,p4]=ThreeSums(p2,p3,p4);

[q1,q2]=TwoSum(q1,q2);
[s0,t0]=TwoSum(p2,q1);
[s1,t1]=TwoSum(p3,q2);
[s1,t0]=TwoSum(s1,t0);
 s2 = t0 + t1 + p4;
 p2 = s0;
 
 p3=a(3)*b(2)+a(4)*b(1)+q3+q4;        %  这个地方QD Libarary中函数写错了。
 [p3,q0]=ThreeSums(p3,q0,s1);
 p4 = q0 + s2;                        % 为什么不在加上一下a(4).*b(2)?

[c(1),c(2),c(3),c(4)] = quick_renorm(p0,p1,p2,p3,p4);
% pt=[p0 p1 p2 p3 p4];
% c = Renormalize(pt);   % 和renorm函数没有关系