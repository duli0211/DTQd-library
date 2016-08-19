function r = sqrt(a)
%SQRT         Implements  sqrt(x)  for triple-double
%
%   y = sqrt(x)
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% 
%     Strategy:  
% 
%      Perform the following Newton iteration:
% 
%        x' = x + (1 - a * x^2) * x / 2;
%        
%      which converges to 1/sqrt(a), starting with the
%      double precision approximation to 1/sqrt(a).
%      Since Newton's iteration more or less doubles the
%      number of correct digits, we only need to perform it 
%      twice.
%    
%    ’‚¿Ôa «triple-double format
 if a==0
     res = TD(0);
     return
 end
 if a<0
     error('the input has to be negative');
 end
 
    r=TD(1.0/sqrt(a.p1));
    h=Mul_pwr2(a,0.5);
    
    
    
    r=r+((0.5-h.*sqr(r)).*r);
    r=r+((0.5-h.*sqr(r)).*r);
    
    r=r.*a;
    
end

     

