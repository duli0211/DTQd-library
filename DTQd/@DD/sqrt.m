function res = sqrt(a)
%SQRT         Implements  sqrt(x)  for double-double
%
%   y = sqrt(x)
% QD library  dd_real.cpp  QD_API dd_real sqrt(const dd_real &a) 
% written by P. B. Du & H. Jiang NUDT 07/01/2013

%    Strategy:  Use Karp's trick:  if x is an approximation
%      to sqrt(a), then
% 
%         sqrt(a) = a*x + [a - (a*x)^2] * x / 2   (approx)
% 
%      The approximation is accurate to twice the accuracy of x.
%      Also, the multiplication (a*x) and [-]*x can be done with
%      only half the precision.
%    这里a是double-double format
 if iszero(a)
     res = DD(0);
     return
 end
%  if a.complex
%     disp('complex number , we do not design method for this case');
%     res=nan;
%     return;
%  else
    x=1/sqrt(a.hi);
    ax=a.hi*x;
    
    ax=DD(ax);
    t1=a-ax.*ax;
    t2=t1.hi.*(x.*0.5);
    res=ax+DD(t2);
%  end
%   这个算法原来只是用来算实数的开方，这里近似的计算复数开方。
end

     
