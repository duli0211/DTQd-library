function [x,y] = TwoProduct(a,b)
%TWOPRODUCT   Error free transformation of a+b into x*y with x=fl(a*b)
%
%   [x,y] = TwoProduct(a,b)
%
%On return, x+y=a*b and x=fl(a*b) provided no over- or underflow occurs .
%Input a,b may be vectors or matrices as well, in single or double precision.
%
%Follows G.W. Veltkamp, see T.J. Dekker: A floating-point technique for 
%  extending the available precision, Numerische Mathematik 18:224-242, 1971.
%Requires 17 flops for scalar input.
%
%Reference implementation! Slow due to interpretation!
%

% written  03/03/07     S.M. Rump
%
% if a or b is 0 add by jh
if(a==0||b==0)
    x=0;y=0;

else% add by jh

  x = a.*b;
  if any(~isfinite(x(:))) 
    error('overflow occurred in TwoProduct')
  end
  if isa(x,'double'); alpha=realmin('double'); else alpha=realmin('single'); end
  if any(abs(x(:)))<alpha
      if x(:)==0
          y=0;
          x=0;
          return
      else
         error('underflow occurred in TwoProduct')
      end
  end
  [ah,al] = Split(a);
  [bh,bl] = Split(b);
  y = al.*bl - ( ( ( x - ah.*bh ) - al.*bh ) - ah.*bl );

end% add by jh