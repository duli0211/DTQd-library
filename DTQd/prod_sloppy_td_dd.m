function c= prod_sloppy_td_dd(a,b)
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
% 这个函数是prod_qd_dd 的sloppy版本 是我自己写的很近似的计算 比较acc版本节省了很多运算 但是精度损失不大。


[p0,q0]=TwoProduct(a(1),b(1));

[p1,q1]=TwoProduct(a(1),b(2));
[p2,q2]=TwoProduct(a(2),b(1));




% three sum

[p1,p2]=ThreeSums(p1,p2,q0);

%O(e^2)

p2=p2+q1+q2+a(2).*b(2)+a(3).*b(1);
 

[c(1),c(2),c(3)] = quick_renorm(p0,p1,p2);

