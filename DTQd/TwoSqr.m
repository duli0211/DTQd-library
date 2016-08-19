function [x,y] = TwoSqr(a)
%TwoProduct(a,a)        Implements  a^2  for double
%   [x,y] = TwoSqr(a)
% QD library inline.h  inline double two_sqr
% written by P. B. Du & H. Jiang NUDT 07/01/2013

% here we only consider a is real double
if a==0
    x=0;y=0;
    return
end
%������һ������jh��ӵ� RUMP������Ҳ��û�й���0�Ŀ��ǡ�
  x = a.*a;
  if any(~isfinite(x(:))) 
    error('overflow occurred in TwoSqr')
  end
  if isa(x,'double'); alpha=realmin('double'); else alpha=realmin('single'); end
  if any(abs(x(:)))<alpha
      if x(:)==0
          y=0;
          x=0;
          return
      else
       abs(x(:))
       error('underflow occurred in TwoSqr')
      end
  end
  [ah,al] = Split(a);
  y = al.*al - ( ( ( x - ah.*ah ) - al.*ah ) - ah.*al );