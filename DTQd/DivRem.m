function [q,r] = DivRem(a,b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

q = a /b;
[x, y] = TwoProduct(q, b);
r = (a-x)-y;