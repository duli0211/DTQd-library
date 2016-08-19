function r = iszero(a)
%ISZERO       Returns array of 1's for zero components
%
%   r = iszero(a)
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%
% a.pi==0 a.pj~=0
% i<j  then the a is wrong.

r=(a.p1==0);

