function res = log(y)
% LOG          Implements  log(y)  for double-double
%  Logarithm.  Computes log(y) in double-double precision.
%  This is a natural logarithm (i.e., base e).        
%   res = log(y)
%
% QD library dd_real.cpp  dd_real log(const dd_real &a) 
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%    

%Strategy.  The Taylor series for log converges much more
%slowly than that of exp, due to the lack of the factorial
%term in the denominator.  Hence this routine instead tries
%to determine the root of the function
% 
%   f(x) = exp(x) - y
% 
% using Newton iteration.  The iteration is given by
% 
%   x' = x - f(x)/f'(x) 
%      = x - (1 - y * exp(-x))
%      = x + y * exp(-x) - 1.
%            
%Only one iteration is needed, since Newton's iteration
%approximately doubles the number of digits per iteration. 


if isreal(y)
    a=y;
    if a==DD(1.0);
        res=DD(0.0);
        return
    elseif a<DD(0.0)
        disp('Non-positive argument');
        res=DD(nan);
        return
    elseif a==DD(0.0)
        res=DD(-inf);
        return
    end
end
        y = DD(y);        % a has to be in double-double format, this line is sure that
        x = DD(log(y.hi));    % Initial approximation 
      res = x + y .* exp(-x) - 1.0;     % compute in double-double format

%这个函数相对误差测试达到10-33

        
        
        
       


