function s = prod_acc_td_d(a, b)
% multiplication algorithm of  a triple-double number a and double prcision number b. 
%
%input : a= a1,a2,a3; 
%        b;
%output: s= s1,s2,s3;
%
% accurate version
% written by P. B. Du & H. Jiang NUDT 07/01/2013



[t1,e1]=TwoProduct(a(1),b);
[t2,e2]=TwoProduct(a(2),b);
[t3,e3]=TwoProduct(a(3),b);


[t2,u2]=TwoSum(t2,e1);

[t3, u3]=ThreeSums(t3, e2, u2);

t4=e3+u3;                  

[s(1),s(2),s(3)] = quick_renorm(t1,t2,t3,t4);

end
