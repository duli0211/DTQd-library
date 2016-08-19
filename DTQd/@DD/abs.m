function c = abs(a)
%ABS          double-double absolute value
% QD library / dd_inline / inline dd_real abs(const dd_real &a)
% fortran /  ddmod / elemental type (dd_real) function ddcabs   
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% a is in double-double format
if a.complex
    ar=real(a);ai=imag(a);  
    t=ar.*ar+ai.*ai;
    c=sqrt(t);
else    
    c=a;
    if a.hi<0
        c=-a;
    end
end


