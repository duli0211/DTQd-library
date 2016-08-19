function res = log(a)
% LOG          Implements  log(a)  for quad-double
%  Logarithm.  Computes log(a) in quad-double precision.
%  This is a natural logarithm (i.e., base e).        
%   res = log(a)
%
% QD library qd_real.cpp    qd_real log(const qd_real &a) 
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
    if a==QD(1.0);
        res=QD(0.0);
        return
    elseif a<QD(0.0)
        disp('Non-positive argument');
        res=QD(nan);
    elseif a==QD(0.0)
        res=QD(-inf);
    else
        x = QD(log(a.p1));    % Initial approximation 
        x = x + a .* exp(-x) - 1.0;     % compute in quad-double format
        x = x + a .* exp(-x) - 1.0;  
        res = x + a .* exp(-x) - 1.0; 
        
    end
end


        
        
        
       


