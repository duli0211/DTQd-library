function res=sinh(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

% since a is small, using the above formula gives
%      a lot of cancellation.  So use Taylor series.
if a.complex
    error('we only consider real number now');
end

if iszero(a)
      res=DD(0);
      return
end

if(abs(a)>0.05)
    ea=exp(a);
    res=Mul_pwr2(ea-inv(ea),0.5);
    return
end

s=a;
t=a;
r=sqr(t);
m=1.0;
thresh=abs(double(a).*double(DD('eps')));

while(abs(t)>thresh)
    m=m+2.0;
    t=t.*r;
    t=t/((m-1)*m);
    s=s+t;
end

res=s;