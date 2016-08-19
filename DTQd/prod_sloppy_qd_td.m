function c= prod_sloppy_qd_td(a,b)
%qd *td
% input : a= [a1 a2 a3 a4]; 
%         b= [b1 b2 b3];
% output: c= [c1 c2 c3 c4];
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
%  the sloppy version


[p0,q0]=TwoProduct(a(1),b(1));
[p1,q1]=TwoProduct(a(1),b(2));
[p2,q2]=TwoProduct(a(2),b(1));
[p3,q3]=TwoProduct(a(1),b(3));
[p4,q4]=TwoProduct(a(2),b(2));
[p5,q5]=TwoProduct(a(3),b(1));

%  Start Accumulation
[p1,e0,e1]=ThreeSums(p1,p2,q0);

%------Six-Two- Sum  of e0, q1, q2, p3, p4, p5. -----
%  outputs: p2 e2 
[t0,t1]=ThreeSums(e0,q1,q2);
[t2,t3]=ThreeSums(p3,p4,p5);
[t4,t5]=TwoSum(t0,t2);
p2=t4;
e2=t1+t3+t5;

%----------------------------------------------------


% O(eps^3) order terms  -- eight-One-Sum 

 p3 = a(2) * b(3) + a(3) * b(2) + a(4) * b(1)  +  e1 + e2 + q3 + q4 +q5;
 
 
[c(1),c(2),c(3),c(4)] = quick_renorm(p0, p1, p2, p3);