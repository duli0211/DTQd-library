function c = rdivide(a,b)
%MLDIVIDE     Implements  a ./ b
%

% written by P. B. Du & H. Jiang NUDT 07/01/2013


if  isa(b,'QD')                       % �ڶ�������������� ���ø��߼���� in QD format
    a=QD(a);
    c=a./b;                           % a �Ѿ��� DD ��Ȼ������������������ ��a���QD��ʽ����QD�ĳ���
    return
end

if  isa(b,'TD')                       % �ڶ�������������� ���ø��߼���� in TD format
    a=TD(a);
    c=a./b;                           % a �Ѿ��� DD ��Ȼ������������������ ��a���TD��ʽ����TD�ĳ���
    return
end



%-----------------------------------------------------------------------------------
%----------------------���ӷ�ĸ����ʵ��------------------------------------------------------
  if isreal(a) && isreal(b)
      c.complex=0;
      if b==0
         error('the denominator can not be 0');
      elseif a==0        % ����һ��Ϊ0 ��˷�Ϊ0 ���Ǹ�����
         c.hi=0;
         c.lo=0;
      else
           if isa(a,'DD') && isa(b,'DD')
              [ c.hi, c.lo ] = div_dd_dd (a.hi, a.lo, b.hi,b.lo);    
           elseif ~isa(a,'DD') && isa(b,'DD')
               if isa(a,'double')
                   [ c.hi, c.lo ] = div_d_dd (a, b.hi, b.lo);
               end
           elseif isa(a,'DD') && ~isa(b,'DD')
               if isa(b,'double')
                   [ c.hi, c.lo ] = div_dd_d (a.hi, a.lo, b);
               end                          
%            elseif a.double==1 && b.double==1                    % ���ʱ����ʵ��������double���㣬Ҫ��ǰ��doubelת��Ϊdouble-double
%               [ c.hi, c.lo ] = Div_d_d(a.hi,b.hi);
           else
              error('other data format, neithor double nor double-double');
           end 
      end
  
%-------------------------------------------------------------------------------------
%--------------------���Ӹ�������ĸ��ʵ��---------------------------------------------------
  elseif ~isreal(a) && isreal(b)         % ��ֻ��һ�����Ǹ�����ʱ����Կ�����������صĲ��ֵļ��㣻
      if iszero(b)
         error('the denominator can not be 0');
      else
         c.complex=1;
         ar=real(a);ai=imag(a);
         cr=ar./b;                        % �൱�ڵ���������������ʵ��������ˣ��ӷ���������ʵ���������໥������
         ci=ai./b;
         c.hi=complex(cr.hi,ci.hi);
         c.lo=complex(cr.lo,ci.lo);
      end

      
 %--------------------------------------------------------------------------------------
 %--------------------����ʵ������ĸ�Ǹ���---------------------------------------------------
  elseif isreal(a) && ~isreal(b)
      if iszero(a)                       % ����һ��Ϊ0 ��˷�Ϊ0 ���Ǹ�����
         c.complex=0;
         c.hi=0;
         c.lo=0;
      else
         c.complex=1;
         br=real(b);bi=imag(b);     
         t1=a.*br;                       % �൱�ڵ���������������ʵ��������ˣ��ӷ���������ʵ���������໥������
         t2=-a.*bi;
         t3=br.*br+bi.*bi;
         cr=t1./t3;
         ci=t2./t3;
         c.hi=complex(cr.hi,ci.hi);
         c.lo=complex(cr.lo,ci.lo);
      end

      
  %------------------------------------------------------------------------------- 
  %--------------------���ӷ�ĸ���Ǹ���---------------------------------------------------
  elseif  ~isreal(a) && ~isreal(b)     %a and b are complex
      c.complex=[];
      ar=real(a);ai=imag(a);
      br=real(b);bi=imag(b); 
      t1=ar.*br+ai.*bi;                 % double-double �ṹ�ĳ˷��ͼ������ӷ�
      t2=ai.*br-ar.*bi;
      t3=br.*br+bi.*bi;
      cr=t1./t3;
      ci=t2./t3;    
      c.hi=complex(cr.hi,ci.hi);
      c.lo=complex(cr.lo,ci.lo);   
     
   %-----------------------------------------------------------------------------   
      if hi(ci)==0  && lo(ci)==0                    % ��������������ܽ��Ϊʵ���� 
          c.complex=0;
      else
          c.complex=1;
      end
  else
       error('other data format, neithor real or complex');    
  end
   
  %------------------------------------------------------------------------------

      
  c = class(c,'DD');
  