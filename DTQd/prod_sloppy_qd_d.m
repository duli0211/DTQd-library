function s = prod_sloppy_qd_d(a, b)
% multiplication algorithm of  a quad-double number a=(a0,a1,a2,a3)  and double prcision number b. see Algorithm for Quad-double precision
%floating point arithmetic.

%input : a= a1,a2,a3,a4; 
%        b;
%output: s= s1,s2,s3,s4;
%
% sloppy version
% written by P. B. Du & H. Jiang NUDT 07/01/2013

[t1,e1]=TwoProduct(a(1),b);
[t2,e2]=TwoProduct(a(2),b);
[t3,e3]=TwoProduct(a(3),b);


[t2,u2]=TwoSum(t2,e1);

[t3, u3]=ThreeSums(t3, e2, u2);


t4=a(4).*b+e3+u3;

[s(1),s(2),s(3),s(4)] = quick_renorm(t1,t2,t3,t4);

end
