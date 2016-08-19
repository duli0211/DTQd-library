function res = eq(a,b)
%EQ           Implements  a == b  elementwise for triple-doubles a and b

%a and b must be either both real or both complex
% written by P. B. Du & H. Jiang NUDT 07/01/2013

% a or b must be dtriple-double format

if  isa(b,'QD')                       % 第二个参数级别更高 调用更高级别的eq 既是 eq in QD format
    res=(b==a);                            % a 已经是 DD 不然不会进入这个函数中来
    return
end

  if ( isreal(a) ~= isreal(b) )
    if ~isreal(a)
      error(' comparison == of complex and real')
    else
      error(' comparison == of real and complex')
    end
    return
  end

  if isa(b,'TD') && isa(a,'TD')      %  
      res = (a.p1==b.p1) & (a.p2==b.p2) & (a.p3==b.p3);
      return
  elseif isa(a,'TD')  && ~isa(b,'TD')     %  
      if isa(b,'DD')
         res = (a.p1==hi(b)) & (a.p2==lo(b)) & (a.p3==0);
         return
      elseif isa(b,'double')
         res = (a.p1==b) & (a.p2==0) & (a.p3==0);
         return
      else
          disp('b is not double nor DD nor QD');
          return
      end
        
  elseif  ~isa(a,'TD')  && isa(b,'TD')                   
    res = (b==a);
    return
  end