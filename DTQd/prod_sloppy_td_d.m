function s = prod_sloppy_td_d(a, b)
% multiplication algorithm of  a triple-double number a and double prcision number b. 
%
%input : a= a1,a2,a3; 
%        b;
%output: s= s1,s2,s3;
%
%sloppy version
% written by P. B. Du & H. Jiang NUDT 07/01/2013





[t1,e1]=TwoProduct(a(1),b);
[t2,e2]=TwoProduct(a(2),b);

[t2,u2]=TwoSum(t2,e1);

t3=a(3).*b+e2+u2;

[s(1),s(2),s(3)] = quick_renorm(t1,t2,t3);

end
