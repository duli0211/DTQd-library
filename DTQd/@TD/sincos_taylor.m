function [sin_a,cos_a]=sincos_taylor(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

if a.complex
    error('we only consider real number now');
end

if iszero(a)
      sin_a=TD(0);
      cos_a=TD(1);
      return
end

sin_a=sin_taylor(a);
cos_a=sqrt(1-sqr(sin_a));