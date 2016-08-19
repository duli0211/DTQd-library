function c= prod_acc_td_dd(a,b)
%td *dd
%input :a= [a0 a1 a2]; b=[ b0 b1];
%output: c= [c0 c1 c2];
%/* triple-double * double-double */
% /* a0 * b0                        0
%         a0 * b1                   1
%         a1 * b0                   2
%              a1 * b1              3
%              a2 * b0              4
%                   a2 * b1         5*/
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% 这个函数是prod_qd_dd 的精确版本 是我自己写的


[p0,q0]=TwoProduct(a(1),b(1));

[p1,q1]=TwoProduct(a(1),b(2));
[p2,q2]=TwoProduct(a(2),b(1));

[p3,q3]=TwoProduct(a(2),b(2));
[p4,q4]=TwoProduct(a(3),b(1));


% three sum

[p1,p2,q0]=ThreeSums(p1,p2,q0);

%-----Five-Two-Sum---------------
% five inputs are p2, p3,p4,q1,q2
% three ouputs are s0,s1
[p2,p3]=ThreeSums(p2,p3,p4);
[q1,q2]=TwoSum(q1,q2);
[s0,t0]=TwoSum(p2,q1);
 s1=p3+t0+q2;
 p2=s0;
%------------------------------------
 

p3=q0+s1+a(3).*b(2)+q3+q4;

[c(1),c(2),c(3)] = quick_renorm(p0,p1,p2,p3);

