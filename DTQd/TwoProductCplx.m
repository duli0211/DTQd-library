function [p,e,f,g] = TwoProductCplx(x,y)
% two complex numbers multiplication.
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% Stef Graillat Compensated complex Horner method
% x=a+bi; y=c+di;

% in mtimes.m and plus.m, we do not use this code
a=real(x);b=imag(x);
c=real(y);d=imag(y);
[z1,h1]=TwoProduct(a,c);[z2,h2]=TwoProduct(b,d);
[z3,h3]=TwoProduct(a,d);[z4,h4]=TwoProduct(b,c);
[z5,h5]=TwoSum(z1,-z2);[z6,h6]=TwoSum(z3,z4);
 p=complex(z5,z6);e=complex(h1,h3);f=complex(-h2,h4);g=complex(h5,h6);