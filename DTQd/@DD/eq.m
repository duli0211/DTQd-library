function res = eq(a,b)
%EQ           Implements  a == b  elementwise for doubel-doubles a and b

%a and b must be either both real or both complex
% written by P. B. Du & H. Jiang NUDT 07/01/2013

% a or b must be double-double format


if  isa(b,'QD')                       % 第二个参数级别更高 调用更高级别的eq 既是 eq in QD format
    res=(b==a);                            % a 已经是 DD 不然不会进入这个函数中来
    return
end

if  isa(b,'TD')                       % 第二个参数级别更高 调用更高级别的eq 既是 eq in TD format
    res=(b==a);                            % a 已经是 DD 不然不会进入这个函数中来
    return
end


a=DD(a);
b=DD(b);

  if ( a.complex ~= b.complex )
    if a.complex
      error(' comparison == of complex and real')
    else
      error(' comparison == of real and complex')
    end
%     return
  end
                  %(isa(b,'DD') && isa(a,'DD'))      %   a and b are in double-double format
    res = (a.hi==b.hi) & (a.lo==b.lo);




  
 



