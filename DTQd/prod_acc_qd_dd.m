function c= prod_acc_qd_dd(a,b)
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
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% 这个函数是prod_qd_dd 的精确版本 是我自己写的


[p0,q0]=TwoProduct(a(1),b(1));
[p1,q1]=TwoProduct(a(1),b(2));
[p2,q2]=TwoProduct(a(2),b(1));

[p3,q3]=TwoProduct(a(2),b(2));
[p4,q4]=TwoProduct(a(3),b(1));

[p5,q5]=TwoProduct(a(3),b(2));
[p6,q6]=TwoProduct(a(4),b(1));

% three sum

[p1,p2,q0]=ThreeSums(p1,p2,q0);

%-----Five-Three-Sum---------------
% five inputs are p2,p3,p4, q1,q2
% three ouputs are s0,s1,s2
[p2,p3,p4]=ThreeSums(p2,p3,p4);

[q1,q2]=TwoSum(q1,q2);
[s0,t0]=TwoSum(p2,q1);
[s1,t1]=TwoSum(p3,q2);
[s1,t0]=TwoSum(s1,t0);
 s2 = t0 + t1 + p4;
 p2 = s0;
%------------------------------------
 
%----Six-Two-Sum---------------------
% six inputs are q0,s1,q3,q4,p5,p6
% two ouputs are p3,s1
[t0,t1]=ThreeSums(q0,s1,q3);
[t2,t3]=ThreeSums(q4,p5,p6);
[t4,t5]=TwoSum(t0,t2);
p3=t4;
s1=t1+t3+t5;
%---------------------------------------
 
p4=s1+s2+q5+q6+a(4).*b(2);

[c(1),c(2),c(3),c(4)] = quick_renorm(p0,p1,p2,p3,p4);


% 我取随机数去计算 prod_acc_qd_dd 精度 10（-68）同时 prod_qd_dd 是10^（-66） 似乎相差不大
% 但是跟具体的例子是否有关系？ 不确定 2013，1，1