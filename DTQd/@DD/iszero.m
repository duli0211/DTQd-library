function r = iszero(a)
%ISZERO       Returns array of 1's for zero components
%
%   r = iszero(a)
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%

if a.hi==0 && a.lo~=0
    error('mistake a.lo has to be zero if a.hi==0');
end

r=(a.hi==0);