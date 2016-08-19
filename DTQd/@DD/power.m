function c = power(a,b )
%Computes the  power of a double-double number (real)
% QD Library dd_real.cpp     dd_real pow(const dd_real &a, int n) dd_real pow(const dd_real &a, const dd_real &b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%
class(b);
if isa (b,'int8') || isa (b, 'uint8')|| isa (b,'int16') || isa (b, 'uint16')||isa (b,'int32') || isa (b, 'uint32')|| isa (b,'int64') || isa (b, 'uint64')
    c=npwr(a,b);
else
    c=exp(b.*log(a));
end



