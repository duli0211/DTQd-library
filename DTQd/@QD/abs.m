function c = abs(a)
%ABS          quad-double absolute value
% a is in quad-double format
% QD library / qd_inline / inline qd_real abs(const qd_real &a) 
% fortran /  ddmod / elemental type (dd_real) function ddcabs   
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

