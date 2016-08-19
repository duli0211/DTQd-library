function res=atan2(y,x)
% written by P. B. Du & H. Jiang NUDT 07/01/2013


% Strategy: Instead of using Taylor series to compute 
%      arctan, we instead use Newton's iteration to solve
%      the equation
% 
%         sin(z) = y/r    or    cos(z) = x/r
% 
%      where r = sqrt(x^2 + y^2).
%      The iteration is given by
% 
%         z' = z + (y - sin(z)) / cos(z)          (for equation 1)
%         z' = z - (x - cos(z)) / sin(z)          (for equation 2)
% 
%      Here, x and y are normalized so that x^2 + y^2 = 1.
%      If |x| > |y|, then first iteration is used since the 
%      denominator is larger.  Otherwise, the second is used.

dd_pi = DD(3.141592653589793116e+00,1.224646799147353207e-16);
dd_pi2 = DD(1.570796326794896558e+00,6.123233995736766036e-17);
dd_pi4 = DD(7.853981633974482790e-01,3.061616997868383018e-17);
dd_3pi4 = DD(2.356194490192344837e+00,9.1848509936051484375e-17);

% if y.complex
%     error('we only consider real number now');
% end
% 
% if x.complex
%     error('we only consider real number now');
% end

if iszero(x)
      if(y>0)
          res=dd_pi2;
          return
      elseif(y<0)
          res=-dd_pi2;
          return
      else
          disp('Both arguments zero.');
          res=DD(nan);
          return
      end
end
if iszero(y)
    if(x>0)
        res=DD(0);
        return
    elseif(x<0)
        res=dd_pi;
        return
    else
        disp('Both arguments zero.');
        res=DD(nan);
        return
    end
end

if iszero(imag(x))
    if iszero(imag(y))
if(x==y)
    if(y>0)
        res=dd_pi4;
        return
    elseif(y<0)
        res=-dd_3pi4;
        return
    else
        disp('Both arguments zero.');
        res=DD(nan);
        return
    end
end
    end
end

if iszero(imag(x))
    if iszero(imag(y))
if(x==-y)
    if(y>0)
        res=dd_3pi4;
        return
    elseif(y<0)
        res=-dd_pi4;
        return
    else
        disp('Both arguments zero.');
        res=DD(nan);
        return
    end
end
    end
end

r=sqrt(sqr(x)+sqr(y));
xx=x./r;
yy=y./r;

z=atan2(double(y),double(x));
z=DD(z);

if(abs(xx.hi)>abs(yy.hi))
    [sin_z,cos_z]=sincos(z);
    z=z+(yy-sin_z)./cos_z;
else
    [sin_z,cos_z]=sincos(z);
%     cos_z
    z=z-(xx-cos_z)./sin_z;
end
res=z;