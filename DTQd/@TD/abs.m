function c = abs(a)
%ABS          qtriple-double absolute value
% a is in triple-double format
% written by P. B. Du & H. Jiang NUDT 07/01/2013

if a.complex
    ar=real(a);ai=imag(a);  
    t=ar.*ar+ai.*ai;
    c=sqrt(t);
else    
    c=a;
    if a.p1<0
        c=-a;
    end
end