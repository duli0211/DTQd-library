function res = eq(a,b)
%EQ           Implements  a == b  elementwise for quad-doubles a and b

%a and b must be either both real or both complex
% written by P. B. Du & H. Jiang NUDT 07/01/2013

% a or b must be double-double format

  if ( isreal(a) ~= isreal(b) )
    if ~isreal(a)
      error(' comparison == of complex and real')
    else
      error(' comparison == of real and complex')
    end
    return
  end

  if isa(b,'QD') && isa(a,'QD')      %  
      res = (a.p1==b.p1) & (a.p2==b.p2) & (a.p3==b.p3) & (a.p4==b.p4);
      return
  

  elseif isa(a,'QD')  && ~isa(b,'QD')     %
      if isa(b,'TD')
         res = (a.p1==b.p1) & (a.p2==b.p2) & (a.p3==b.p3) & (a.p4==0);
         return
      elseif isa(b,'DD')
         res = (a.p1==hi(b)) & (a.p2==lo(b)) & (a.p3==0) & (a.p4==0);
         return
      elseif isa(b,'double')
         res = (a.p1==b) & (a.p2==0) & (a.p3==0) & (a.p4==0);
         return
      else
          disp('b is not double nor DD nor QD');
          return
      end
        
  elseif  ~isa(a,'QD')  && isa(b,'QD')                   
    res = (b==a);
    return
  end