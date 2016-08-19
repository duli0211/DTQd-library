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

qd_pi = TD(3.141592653589793116e+00, 1.224646799147353207e-16,  -2.994769809718339666e-33);
qd_pi2 = TD(1.570796326794896558e+00,  6.123233995736766036e-17,   -1.497384904859169833e-33);
qd_pi4 = TD(7.853981633974482790e-01,  3.061616997868383018e-17,   -7.486924524295849165e-34);
qd_3pi4 = TD(2.356194490192344837e+00,   9.1848509936051484375e-17,   3.9168984647504003225e-33);

if y.complex
    error('we only consider real number now');
end

if x.complex
    error('we only consider real number now');
end

if iszero(x)
      if(y>0)
          res=td_pi2;
          return
      elseif(y<0)
          res=-td_pi2;
          return
      else
          disp('Both arguments zero.');
          res=TD(nan);
          return
      end
end
if iszero(y)
    if(x>0)
        res=TD(0);
        return
    elseif(x<0)
        res=td_pi;
        return
    else
        disp('Both arguments zero.');
        res=TD(nan);
        return
    end
end

if(x==y)
    if(y>0)
        res=td_pi4;
        return
    elseif(y<0)
        res=-td_3pi4;
        return
    else
        disp('Both arguments zero.');
        res=TD(nan);
        return
    end
end

if(x==-y)
    if(y>0)
        res=td_3pi4;
        return
    elseif(y<0)
        res=-td_pi4;
        return
    else
        disp('Both arguments zero.');
        res=TD(nan);
        return
    end
end

r=sqrt(sqr(x)+sqr(y));
xx=x./r;
yy=y./r;

z=atan2(double(y),double(x));
z=TD(z);

if(abs(xx.p1)>abs(yy.p1))
    [sin_z,cos_z]=sincos(z);
    z=z+(yy-sin_z)./cos_z;
    [sin_z,cos_z]=sincos(z);
    z=z+(yy-sin_z)./cos_z;
    [sin_z,cos_z]=sincos(z);
    z=z+(yy-sin_z)./cos_z;
else
    [sin_z,cos_z]=sincos(z);
    z=z-(xx-cos_z)./sin_z;
    [sin_z,cos_z]=sincos(z);
    z=z-(xx-cos_z)./sin_z;
    [sin_z,cos_z]=sincos(z);
    z=z-(xx-cos_z)./sin_z;
end
res=z;