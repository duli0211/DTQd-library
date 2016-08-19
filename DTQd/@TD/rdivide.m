function c = rdivide(a,b)
%MLDIVIDE     Implements  a ./ b
%

% written by P. B. Du & H. Jiang NUDT 07/01/2013





if  isa(b,'QD')                       % �ڶ�������������� ���ø��߼���� in QD format
    a=QD(a);
    c=a./b;                           % a �Ѿ��� TD ��Ȼ������������������ ��a���QD��ʽ����QD�ĳ���
    return
end


  c.complex=[];
%-----------------------------------------------------------------------------------
%----------------------���ӷ�ĸ����ʵ��------------------------------------------------------
%----------------------����ʵ��------------------------------------------------------
  if isreal(a) && isreal(b)
      c.complex=0;
         if isa(a,'TD') && isa(b,'TD')
         at=[a.p1 a.p2 a.p3];bt=[b.p1 b.p2 b.p3];
         ct = div_td_td (at,bt);
         c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); 
         elseif isa(a,'TD') && ~isa(b,'TD') 
             if isa(b,'DD')
                at=[a.p1 a.p2 a.p3];  
                bt=[hi(b) lo(b)];
                ct = div_td_dd (at, bt);
                c.p1=ct(1); c.p2=ct(2); c.p3=ct(3);
             elseif isa(b,'double')
                at=[a.p1 a.p2 a.p3]; 
                ct = div_td_d (at, b);
                c.p1=ct(1); c.p2=ct(2); c.p3=ct(3);
             else
                error('b is not double nor dd');
             end 
         elseif ~isa(a,'TD') && isa(b,'TD') 
             if isa(a,'DD') || isa(a,'double')
                a=TD(a);                
                at=[a.p1 a.p2 a.p3 ];
                bt=[b.p1 b.p2 b.p3 ];
                ct = div_td_td (at, bt);
                c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); 
             else
                error('a is not double nor dd');
             end 
         else
             error('a and b both not in TD form');
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
         c.p1=complex(cr.p1,ci.p1);
         c.p2=complex(cr.p2,ci.p2);
         c.p3=complex(cr.p3,ci.p3);
      end

      
 %--------------------------------------------------------------------------------------
 %--------------------����ʵ������ĸ�Ǹ���---------------------------------------------------
  elseif isreal(a) && ~isreal(b)
      if a==0                      % ����һ��Ϊ0 ��˷�Ϊ0 ���Ǹ�����
         c.complex=0;
         c.p1=0;
         c.p2=0;
         c.p3=0;
      else
         c.complex=1;
         br=real(b);bi=imag(b);     
         t1=a.*br;                       % �൱�ڵ���������������ʵ��������ˣ��ӷ���������ʵ���������໥������
         t2=-a.*bi;
         t3=br.*br+bi.*bi;
         cr=t1./t3;
         ci=t2./t3;
         c.p1=complex(cr.p1,ci.p1);
         c.p2=complex(cr.p2,ci.p2);
         c.p3=complex(cr.p3,ci.p3);
      end

      
  %------------------------------------------------------------------------------- 
  %--------------------���ӷ�ĸ���Ǹ���---------------------------------------------------
  elseif  ~isreal(a) && ~isreal(b)     %a and b are complex
      c.complex=[];
      ar=real(a);ai=imag(a);
      br=real(b);bi=imag(b); 
      t1=ar.*br+ai.*bi;                 % quad-double �ṹ�ĳ˷��ͼ������ӷ�
      t2=ai.*br-ar.*bi;
      t3=br.*br+bi.*bi;
      cr=t1./t3;
      ci=t2./t3;    
      c.p1=complex(cr.p1,ci.p1);
      c.p2=complex(cr.p2,ci.p2);
      c.p3=complex(cr.p3,ci.p3);
     
   %-----------------------------------------------------------------------------   
      if  ci.p1==0                      % ����������������ܽ��Ϊʵ��  
          c.complex=0;
      else
          c.complex=1;
      end
  else
       error('other data format, neithor real or complex');    
  end
   
  %------------------------------------------------------------- 
    
  c = class(c,'TD');
  