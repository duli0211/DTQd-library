function c= prod_acc_td_td(a,b)
%td *td
%input :a= [a0 a1 a2]; b=[ b0 b1 b2];
%output: c= [c0 c1 c2];
% /* triple-double * triple-double */
% /* a0 * b0                    0
%         a0 * b1               1
%         a1 * b0               2
%              a0 * b2          3
%              a1 * b1          4
%              a2 * b0          5
%                   a1 * b2     6
%                   a2 * b1     7 */
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% accurate version

[p0,q0]=TwoProduct(a(1),b(1));
[p1,q1]=TwoProduct(a(1),b(2));
[p2,q2]=TwoProduct(a(2),b(1));
[p3,q3]=TwoProduct(a(1),b(3));
[p4,q4]=TwoProduct(a(2),b(2));
[p5,q5]=TwoProduct(a(3),b(1));

%  Start Accumulation
[p1,e0,e1]=ThreeSums(p1,p2,q0);

%  Six-Two Sum  of e0, q1, q2, p3, p4, p5. 
%  two ouputs are p2,e2
[t0,t1]=ThreeSums(e0,q1,q2);
[t2,t3]=ThreeSums(p3,p4,p5);
[t4,t5]=TwoSum(t0,t2);
p2=t4;
e2=t1+t3+t5;
%---------------------------------------
 
% O(eps^3) order terms 

p3=q3+q4+q5+e1+e2+a(2).*b(3)+a(3).*b(2);


[c(1),c(2),c(3)] = quick_renorm(p0, p1, p2,p3);