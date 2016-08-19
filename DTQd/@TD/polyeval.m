function res=polyeval(P,x)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

%P=TD([]) P=P(1)+P(2)*x+P(3)*x^2...P(n+1)*x^n
n=size(P,2);    %degree of n-1
if(n==1)
    res=P;
    return
end
r=P(n);
for i=n-1:-1:1
    r=r.*x;
    r=r+P(i);
end
res=r;