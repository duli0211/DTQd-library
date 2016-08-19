function c = nroot(a,n )
%  Computes the n-th root of the double-double number a.
%  NOTE: n must be a positive integer.  
%  NOTE: If n is even, then a must not be negative.      
%  QD Library dd_real.cpp   dd_real.cpp  dd_real nroot
% written by P. B. Du & H. Jiang NUDT 07/01/2013

%  ��matlab���Ҳ�֪����Ӧ�ĸ���������������  �������û�в��ԣ�������������


%  Strategy:  Use Newton iteration for the function
% 
%           f(x) = x^(-n) - a
% 
%      to find its root a^{-1/n}.  The iteration is thus
% 
%           x' = x + x * (1 - a * x^n) / n
% 
%  which converges quadratically.  We can then find 
%    a^{1/n} by taking the reciprocal.


if ~isa (n,'int8') && ~isa (n, 'uint8')&& ~isa (n,'int16') && ~isa (n, 'uint16')&&~isa (n,'int32')&& ~isa (n, 'uint32')&& ~isa (n,'int64')&& ~isa (n, 'uint64')
    disp('n must be in int format')
    c=DD(nan);
    return
end


if n<=0
    disp('N must be positive');
    c=DD(nan);
    return
end

if mod(n,2)==0 && a<0
    disp('Negative argument');
    c=DD(nan);
    return
end

if n==1
    c=a;
    return
end

if n==2
    c=sqrt(a);
    return
end

if isreal(a)
if a==DD(0)
    c=DD(0);
    return
end
end

%   Note  a^{-1/n} = exp(-log(a)/n) 
r=abs(a);
x=exp(-log(r.hi)/double(n));
x=DD(x);

%   Perform Newton's iteration. 
x=x+x.*(1.0-r.*npwr(x,n))./double(n);
% x=x+x.*(1.0-r.*npwr(x,n))./double(n);
% x=x+x.*(1.0-r.*npwr(x,n))./double(n);
% x=x+x.*(1.0-r.*npwr(x,n))./double(n);                  % ԭ���ĺ�������ֻ�е���һ�Σ����������5�� һ�������������ȴ�š�(��ʵû��Ҫ)

% x=x+x.*(1.0-r.*npwr(x,n))./double(n);
c=inv(x);

if a.hi<0
    x=-x;
    c=1.0./x;
end









    







