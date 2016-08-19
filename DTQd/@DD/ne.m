function res = ne(a,b)
%NE           Implements  a ~= b  elementwise for  a and b in doubel-double format

%a and b must be either both real or both complex
% written by P. B. Du & H. Jiang NUDT 07/01/2013

% a or b must be double-double format

  if ( a.complex ~= b.complex )
    if a.complex
      error(' comparison ~= of complex and real')
    else
      error(' comparison ~= of real and complex')
    end
  end
  
  res= ~eq(a,b);
  
  