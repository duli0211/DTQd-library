function [n,r]=divrem(a,b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

n=round(a./b);
r=a-n.*b;