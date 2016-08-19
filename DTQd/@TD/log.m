function res = log(a)
% LOG          Implements  log(a)  for triple-double
%  Logarithm.  Computes log(a) in triple-double precision.
%  This is a natural logarithm (i.e., base e).        
%   res = log(a)
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%    

%      Strategy.  The Taylor series for log converges much more
%      slowly than that of exp, due to the lack of the factorial
%      term in the denominator.  Hence this routine instead tries
%      to determine the root of the function
% 
%          f(x) = exp(x) - a
% 
%      using Newton iteration.  The iteration is given by
% 
%          x' = x - f(x)/f'(x) 
%             = x - (1 - a * exp(-x))
%             = x + a * exp(-x) - 1.
%            
%      Two iteration is needed, since Newton's iteration 
%      approximately doubles the number of digits per iteration. */


if a.complex
    error('we only consider real number now');
else
    if a==TD(1.0);
        res=TD(0.0);
        return
    elseif a<TD(0.0)
        disp('Non-positive argument');
        res=TD(nan);
    elseif a==TD(0.0)
        res=TD(-inf);
    else
        x = TD(log(a.p1));               % Initial approximation 
        x = x + a .* exp(-x) - 1.0;      % compute in triple-double format
       % x = x + a .* exp(-x) - 1.0;     % in DD 1 iteration; in QD 3 iterations; so in TD only 2 iteration is enough 
        res = x + a .* exp(-x) - 1.0; 
        
    end
end



