function [p,e,f,g] = TwoProductCplxSS(x,y)
% two complex numbers multiplication with only single splitting
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% Stef Graillat Compensated complex Horner method
% x=a+bi; y=c+di;

% in mtimes.m and plus.m, we do not use this code
  a=real(x);b=imag(x);
  c=real(y);d=imag(y);
  [a1,a2] = Split(a);
  [b1,b2] = Split(b);
  [c1,c2] = Split(c);
  [d1,d2] = Split(d);
  z1=a.*c;z2=b.*d;z3=a.*d;z4=b.*c;
  h1=a2.*c2-(((x-a1.*c1)-a2.*c1)-a1.*c2);
  h2=b2.*d2-(((x-b1.*d1)-b2.*d1)-b1.*d2);
  h3=a2.*d2-(((x-a1.*d1)-a2.*d1)-a1.*d2);
  h4=b2.*c2-(((x-b1.*c1)-b2.*c1)-b1.*c2);
  [z5,h5]=TwoSum(z1,-z2);[z6,h6]=TwoSum(z3,z4);
  p=complex(z5,z6);e=complex(h1,h3);f=complex(-h2,h4);g=complex(h5,h6);