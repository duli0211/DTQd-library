function r = isreal(c)
%ISREAL       returns 1 if c is real  double-double format
%
%  r = isreal(c)
%

% written by P. B. Du & H. Jiang NUDT 07/01/2013

%

  r = ~c.complex;
