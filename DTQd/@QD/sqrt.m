function r = sqrt(a)
%SQRT         Implements  sqrt(x)  for quad-double
%
%   y = sqrt(x)
% QD library  qd_real.cpp  QD_API qd_real sqrt(const qd_real &a) 
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
%    这里a是quad-double format
 if a==0
     res = QD(0);
     return
 end
 if a<0
     error('the input has to be negative');
 end
 
%  if a.complex
%     disp('complex number , we do not design method for this case');
%     res=nan;
%     return;
%  else
    r=QD(1.0/sqrt(a.p1));
    h=Mul_pwr2(a,0.5);
    
    
    
    r=r+((0.5-h.*sqr(r)).*r);
    r=r+((0.5-h.*sqr(r)).*r);
    r=r+((0.5-h.*sqr(r)).*r);
    
    r=r.*a;
    
%  end
%   这个算法原来只是用来算实数的开方，这里近似的计算复数开方。
end

     

