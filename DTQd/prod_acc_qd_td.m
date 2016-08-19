function c= prod_acc_qd_td(a,b)
%qd *td
%input : a= [a1 a2 a3 a4]; 
%        b= [b1 b2 b3];
%output: c= [c1 c2 c3 c4];
%/* quad-double * triple-double */
%/*  a1 * b1                        0
%         a1 * b2                   1
%         a2 * b1                   2
%              a1 * b3              3
%              a2 * b2              4
%              a3 * b1              5
%                   a2 * b3         6
%                   a3 * b2         7
%                   a4 * b1         8
%                        a3 * b3    9 
%                        a4 * b1    10 */
% written by P. B. Du & H. Jiang NUDT 07/01/2013



[p0,q0]=TwoProduct(a(1),b(1));
[p1,q1]=TwoProduct(a(1),b(2));
[p2,q2]=TwoProduct(a(2),b(1));
[p3,q3]=TwoProduct(a(1),b(3));
[p4,q4]=TwoProduct(a(2),b(2));
[p5,q5]=TwoProduct(a(3),b(1));

%  Start Accumulation
[p1,e0,e1]=ThreeSums(p1,p2,q0);

%------Six-Three Sum  of e0, q1, q2, p3, p4, p5. -----
%  outputs: p2 e2 e3
[e0,q1,q2]=ThreeSums(e0,q1,q2);
[p3,p4,p5]=ThreeSums(p3,p4,p5);

%  compute (p2, e2, e3) = (e0, q1, q2) + (p3, p4, p5).
[p2,t0]=TwoSum(e0,p3);
[e2,t1]=TwoSum(q1,p4);
 e3 = q2 + p5;
[e2,t0]=TwoSum(e2, t0);
 e3 = e3 + (t0 + t1);
%----------------------------------------------------


% O(eps^3) order terms 
[p6,q6]=TwoProduct(a(2),b(3));
[p7,q7]=TwoProduct(a(3),b(2));
[p8,q8]=TwoProduct(a(4),b(1));



% Eight-Two-Sum of e1, e2, q3, q4, q5, p6, p7, p8. 

[t0,t1]=TwoSum(e1,e2);
[t2,t3]=TwoSum(q3,q4);
[t4,t5]=TwoSum(q5,p6);
[t6,t7]=TwoSum(p7,p8);

%Compute (s0, s1) = (t0, t1) + (t2, t3). 
[s0,s1]=TwoSum(t0,t2);
s1=s1+(t1 + t3);

% Compute (\r0, r1) = (t4, t5) + (t6, t7).
[r0,r1]=TwoSum(t4,t6);
 r1 =r1+ (t5 + t7);
 
% Compute (p3, e4) = (s0, s1) + (r0, r1). 
[p3, e4]=TwoSum(s0, r0);
 e4 =e4+ (s1 + r1);

 
% O(eps^4) terms -- Seven-One-Sum 
 p4 = a(3) * b(3) + a(4) * b(2) +  q6 + q7 + q8 + e3+ e4;
 
 
[c(1),c(2),c(3),c(4)] = quick_renorm(p0, p1, p2, p3, p4);