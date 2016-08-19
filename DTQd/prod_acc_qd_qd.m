function c= prod_acc_qd_qd(a,b)
%qd *dd
%input :a= [a0 a1 a2 a3]; b=[ b0 b1 b2 b3];
%output: c= [c0 c1 c2 c3];
% /* quad-double * quad-double */
% /* a0 * b0                    0
%         a0 * b1               1
%         a1 * b0               2
%              a0 * b2          3
%              a1 * b1          4
%              a2 * b0          5
%                   a0 * b3     6
%                   a1 * b2     7
%                   a2 * b1     8
%                   a3 * b0     9  */
% QD library qd_inline.h  inline qd_real qd_real::accurate_mul(const qd_real &a, const qd_real &b) 
% written by P. B. Du & H. Jiang NUDT 07/01/2013

% 这个算法是QD paper上面的算法 应该比prod_qd_qd精确一些。

[p0,q0]=TwoProduct(a(1),b(1));
[p1,q1]=TwoProduct(a(1),b(2));
[p2,q2]=TwoProduct(a(2),b(1));
[p3,q3]=TwoProduct(a(1),b(3));
[p4,q4]=TwoProduct(a(2),b(2));
[p5,q5]=TwoProduct(a(3),b(1));

%  Start Accumulation
[p1,p2,q0]=ThreeSums(p1,p2,q0);

%  Six-Three Sum  of p2, q1, q2, p3, p4, p5. 
[p2,q1,q2]=ThreeSums(p2,q1,q2);
[p3,p4,p5]=ThreeSums(p3,p4,p5);

%  compute (s0, s1, s2) = (p2, q1, q2) + (p3, p4, p5).
[s0,t0]=TwoSum(p2,p3);
[s1,t1]=TwoSum(q1,p4);
 s2 = q2 + p5;
[s1,t0]=TwoSum(s1, t0);
 s2 = s2 + (t0 + t1);

 
% O(eps^3) order terms 
[p6,q6]=TwoProduct(a(1),b(4));
[p7,q7]=TwoProduct(a(2),b(3));
[p8,q8]=TwoProduct(a(3),b(2));
[p9,q9]=TwoProduct(a(4),b(1));


% Nine-Two-Sum of q0, s1, q3, q4, q5, p6, p7, p8, p9. 

[q0,q3]=TwoSum(q0,q3);
[q4,q5]=TwoSum(q4,q5);
[p6,p7]=TwoSum(p6,p7);
[p8,p9]=TwoSum(p8,p9);

%Compute (t0, t1) = (q0, q3) + (q4, q5). 
[t0,t1]=TwoSum(q0,q4);
t1=t1+(q3 + q5);

% Compute (r0, r1) = (p6, p7) + (p8, p9).
[r0,r1]=TwoSum(p6,p8);
 r1 =r1+ (p7 + p9);
% Compute (q3, q4) = (t0, t1) + (r0, r1). 
[q3, q4]=TwoSum(t0, r0);
 q4 =q4+ (t1 + r1);
% Compute (t0, t1) = (q3, q4) + s1.
[t0, t1]=TwoSum(q3, s1);
 t1 =t1+ q4;

 
% O(eps^4) terms -- Nine-One-Sum 
  t1 = t1 + a(2) * b(4) + a(3) * b(3) + a(4) * b(2) + q6 + q7 + q8 + q9 + s2;
 
 
[c(1),c(2),c(3),c(4)] = quick_renorm(p0, p1, s0, t0, t1);