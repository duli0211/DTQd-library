function c = round(a)
% round(X) rounds the elements of X to the nearest integers. 
% Positive elements with a fractional part of 0.5 round up to the nearest positive integer. 
% Negative elements with a fractional part of -0.5 round down to the nearest negative integer. 
% For complex X, the imaginary and real parts are rounded independently.
% QD library dd_inline.h   inline dd_real nint
% written by P. B. Du & H. Jiang NUDT 07/01/2013

c=a;                     %initial
c.hi= round(a.hi);       % a is complex is also work here

if a.complex
    ar=real(a);ai=imag(a);
    cr=round(ar);                    % 调用自身函数
    ci=round(ai);
    c.hi=complex(cr.hi,ci.hi);
    c.lo=complex(cr.lo,ci.lo);
else
     if c.hi==a.hi
         c.lo=round(a.lo);                       % High word is an integer already.  Round the low word.
         [c.hi,c.lo]=FastTwoSum(c.hi,c.lo);      % Renormalize. This is needed if x[0] = some integer, x[1] = 1/2.
     else
         c.lo=0.0;
         if c.hi-a.hi==0.5 && a.lo<0.0            % These two parts are different from that in QD library
             c.hi=c.hi-1.0;
         end
         if c.hi-a.hi==-0.5 && a.lo>0.0
             c.hi=c.hi+1.0;
         end  
     end
end
 
