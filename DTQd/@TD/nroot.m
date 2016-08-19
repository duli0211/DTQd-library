function c = nroot(a,n )
%  Computes the n-th root of the triple-double number a.
%  NOTE: n must be a positive integer.  
%  NOTE: If n is even, then a must not be negative.      
% written by P. B. Du & H. Jiang NUDT 07/01/2013

%  在matlab中我不知到对应哪个函数？？？？？  这个函数没有测试！！！！！！！

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
%      Since Newton's iteration converges quadratically, 
%      we only need to perform it twice.



if ~isa (n,'int8') && ~isa (n, 'uint8')&& ~isa (n,'int16') && ~isa (n, 'uint16')&&~isa (n,'int32')&& ~isa (n, 'uint32')&& ~isa (n,'int64')&& ~isa (n, 'uint64')
    disp('n must be in int format')
    c=TD(nan);
    return
end


if n<=0
    disp('N must be positive');
    c=TD(nan);
    return
end

if mod(n,2)==0 && a<0
    disp('Negative argument');
    c=TD(nan);
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

if a==TD(0)
    c=TD(0);
    return
end

%   Note  a^{-1/n} = exp(-log(a)/n) 
r=abs(a);
x=a.p1.^(-1/double(n));
% class(x)
x=TD(x);

%   Perform Newton's iteration. 
x=x+x.*(1.0-r.*npwr(x,n))./double(n);
x=x+x.*(1.0-r.*npwr(x,n))./double(n);
x=x+x.*(1.0-r.*npwr(x,n))./double(n);
x=x+x.*(1.0-r.*npwr(x,n))./double(n);                  % 原来的函数里面只有迭代一次  我这里迭代了5次 一次提升两个精度大概。

x=x+x.*(1.0-r.*npwr(x,n))./double(n);
c=inv(x);

if a.p1<0
    x=-x;
    c=1.0./x;
end


% test\
%>>a=TDrand(TD(1))
%>>c=int32(17)
%>>f=nroot(a,c)
%>>fs=sym(a).^(-1/sym(c,'f'))
%>>double((sym(f)-fs)/fs)






    







