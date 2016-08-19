function c = times(a,b)
%TIMES        Implements  a .* b  for double-double
%incluing double-double, double, real or complex format
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013


if  isa(b,'TD')                       % �ڶ�������������� ���ø��߼����times ���� times in TD format
    c=b.*a;                            % a �Ѿ��� DD ��Ȼ������������������
    return
end

if  isa(b,'QD')                       % �ڶ�������������� ���ø��߼����times ���� times in QD format
    c=b.*a;                            % a �Ѿ��� DD ��Ȼ������������������
    return
end



%-----------------------------------------------------------------------------------
%----------------------����ʵ��------------------------------------------------------
  if isreal(a) && isreal(b)
      c.complex=0;
      if a==0 || b==0         % ����һ��Ϊ0 ��˷�Ϊ0 ���Ǹ�����
         c.hi=0;
         c.lo=0;
      else
           if isa(a,'DD') && isa(b,'DD')
              [ c.hi, c.lo ] = prod_dd_dd (a.hi, a.lo, b.hi,b.lo);    
           elseif ~isa(a,'DD') && isa(b,'DD')
               if isa(a, 'double')
                   [ c.hi, c.lo ] = prod_dd_d (b.hi, b.lo, a);
               end
           elseif isa(a,'DD') && ~isa(b,'DD')
               if isa(b, 'double')
                  [ c.hi, c.lo ] = prod_dd_d (a.hi, a.lo, b);
               end               
%            elseif a.double==1 && b.double==1                % ���ʱ����ʵ��������double���㣬Ҫ��ǰ��doubelת��Ϊdouble-double
%               [ c.hi, c.lo ] = TwoProduct(a.hi,b.hi);
           else
              error('other data format, neithor double nor double-double');
           end 
      end
  
%-------------------------------------------------------------------------------------
%--------------------һ������һ��ʵ��---------------------------------------------------
  elseif ~isreal(a) && isreal(b)         % ��ֻ��һ�����Ǹ�����ʱ����Կ�����������صĲ��ֵļ��㣻
         c.complex=1;
         ar=real(a);ai=imag(a);
         cr=ar.*b;                        % �൱�ڵ���������������ʵ��������ˣ��ӷ���������ʵ���������໥������
         ci=ai.*b;
         c.hi=complex(cr.hi,ci.hi);
         c.lo=complex(cr.lo,ci.lo);
      
 %--------------------------------------------------------------------------------------
 %--------------------һ������һ��ʵ��---------------------------------------------------
  elseif isreal(a) && ~isreal(b)
      if iszero(a)                       % ����һ��Ϊ0 ��˷�Ϊ0 ���Ǹ�����
         c.complex=0;
         c.hi=0;
         c.lo=0;
      else
         c.complex=1;
         br=real(b);bi=imag(b);
         cr=br.*a;                        % �൱�ڵ���������������ʵ��������ˣ��ӷ���������ʵ���������໥������
         ci=bi.*a;
         c.hi=complex(cr.hi,ci.hi);
         c.lo=complex(cr.lo,ci.lo);
      end

      
  %------------------------------------------------------------------------------- 
  %--------------------��������---------------------------------------------------
  elseif  ~isreal(a) && ~isreal(b)     %a and b are complex
      c.complex=[];
      ar=real(a);ai=imag(a);
      br=real(b);bi=imag(b); 
      cr=ar.*br-ai.*bi;                 %double-double �ṹ�ĳ˷��ͼ������ӷ�
      ci=ai.*br+ar.*bi;
      c.hi=complex(cr.hi,ci.hi);
      c.lo=complex(cr.lo,ci.lo);   
     
   %-----------------------------------------------------------------------------   
      if ci.hi==0 && ci.lo==0            % ����������˿��ܽ��Ϊʵ��   
          c.complex=0;
      else
          c.complex=1;
      end
  else
       error('other data format, neithor real or complex');    
  end
   
  %------------------------------------------------------------------------------
      
  c = class(c,'DD');
  