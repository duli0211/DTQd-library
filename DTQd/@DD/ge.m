function res = ge(a,b)
%GE           Implements  a >= b  elementwise for doubel-doubles a and b
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% we only consider real number not consider the complex number


    if isa(a,'QD') || isa(b,'QD')
        res=QD(a)>=QD(b);
    elseif isa(a,'TD') || isa(b,'TD')
        res=TD(a)>=TD(b);
    elseif isa(a,'DD') || isa(b,'DD')
        a=DD(a);
        b=DD(b);
        res= a.hi>b.hi || (a.hi==b.hi && a.lo>=b.lo);
    end






