function res = eq(a,b)
%EQ           Implements  a == b  elementwise for doubel-doubles a and b

%a and b must be either both real or both complex
% written by P. B. Du & H. Jiang NUDT 07/01/2013

% a or b must be double-double format


if  isa(b,'QD')                       % �ڶ�������������� ���ø��߼����eq ���� eq in QD format
    res=(b==a);                            % a �Ѿ��� DD ��Ȼ������������������
    return
end

if  isa(b,'TD')                       % �ڶ�������������� ���ø��߼����eq ���� eq in TD format
    res=(b==a);                            % a �Ѿ��� DD ��Ȼ������������������
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




  
 



