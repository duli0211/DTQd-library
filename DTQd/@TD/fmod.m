function res=fmod(a,b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

n=floor(a./b);
res=a-b.*n;