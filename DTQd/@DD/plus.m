function c = plus(a,b)
%PLUS         Implements  a + b  for double-double 
%incluing double-double, double, real or complex format
%

% written by P. B. Du & H. Jiang NUDT 07/01/2013



if  isa(b,'QD')                       % �ڶ�������������� ���ø��߼����plus ���� plus in QD format
    c=b+a;                            % a �Ѿ��� DD ��Ȼ������������������
    return
end

if  isa(b,'TD')                       % �ڶ�������������� ���ø��߼����plus ���� plus in TD format
    c=b+a;                            % a �Ѿ��� DD ��Ȼ������������������
    return
end


  if isreal(a) && isreal(b)
      c.complex=0;   
      if isa(a,'DD') && isa(b,'DD')                 
         [ c.hi, c.lo ] = add_dd_dd (a.hi, a.lo, b.hi,b.lo);    
      elseif  ~isa(a,'DD') && isa(b,'DD')
          if isa(a,'double')
              [ c.hi, c.lo ] = add_dd_d (b.hi, b.lo, a);
          end
      elseif isa(a,'DD') && ~isa(b,'DD')
          if isa(b,'double')
              [ c.hi, c.lo ] = add_dd_d (a.hi, a.lo, b);
          end
%       elseif a.double==1 && b.double==1               % ���ʱ����ʵ��������double���㣬Ҫ��ǰ��doubelת��Ϊdouble-double
%          [ c.hi, c.lo ] = TwoSum(a.hi,b.hi);
      else
          disp('other data format, neithor double nor double-double');
      end 

  elseif  ~isreal(a) && ~isreal(b)     %a and b are complex
      c.complex=[];
      ar=real(a);ai=imag(a);
      br=real(b);bi=imag(b);
      cr=ar+br;                        % �൱�ڵ���������������ʵ��������ˣ��ӷ���������ʵ���������໥������
      ci=ai+bi;                        % ����cr��ciΪDD��Ľṹ����ʽ
      c.hi=complex(cr.hi,ci.hi);
      c.lo=complex(cr.lo,ci.lo);
      
      if ci.hi==0                      % ����������ӿ��ܽ��Ϊʵ�� ��ʱ���� ci.lo=0  
          c.complex=0;
      else
          c.complex=1;
      end
  elseif ~isreal(a) && isreal(b)       % a is complex; b is real.
      c.complex=1;
      ar=real(a);ai=imag(a);
      cr=ar+b;
      ci=ai;
      c.hi=complex(cr.hi,ci.hi);
      c.lo=complex(cr.lo,ci.lo);
      
   elseif  isreal(a) && ~isreal(b)      % b is complex; a is real.
      c.complex=1;
      br=real(b);bi=imag(b);
      cr=br+a;
      ci=bi;
      c.hi=complex(cr.hi,ci.hi);
      c.lo=complex(cr.lo,ci.lo);
%     another method     
%     c.complex=1;
%     ct=b+a;
%     c.hi=ct.hi;
%     c.lo=ct.lo;
  else
       error('other data format, neithor real or complex');    
  end
  
  
  %------------------------------------------------------------- 
  %--------------------------------------------------------------  
      
  c = class(c,'DD');
  

