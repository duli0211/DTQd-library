function b = Renormalize( a )
%This renormalization procedure is a variant of Priest's renormalization
%method.Ph.D thesis. Also available on Algorithm for Quad-double precision
%floating point arithmetic.
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% the input is a five-term expansion with limited overlapping bits, wih a0
% being the most significant component
% output b=(b0,b1,b2,b3) 
if nargin==4
a=[a 0];  %当输入是4个的时候填写一个零  临时这么处理一下， 2012/12/31
end

t=zeros(1,5);
b=zeros(1,4);
n=length(a);

[s,t(4+1)] = FastTwoSum(a(3+1),a(4+1));
[s,t(3+1)] = FastTwoSum(a(2+1),s);
[s,t(2+1)] = FastTwoSum(a(1+1),s);
[t(0+1),t(1+1)] = FastTwoSum(a(0+1),s);

s=t(0+1);
k=0;

for i=1:4
    [s,e] = FastTwoSum(s,t(i+1));
        b(k+1)=s; 
    if e~=0                                                       %个人感觉如果当i=4时候，e=0，那么怎么办个人感觉有点问题吧！！！
        s=e;
        k=k+1;            
    end
end

end

% p = VecSum(a)
% b=p(1:n-1);

