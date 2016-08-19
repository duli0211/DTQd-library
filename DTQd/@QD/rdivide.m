function c = rdivide(a,b)
%MLDIVIDE     Implements  a ./ b
%

% written by P. B. Du & H. Jiang NUDT 07/01/2013

  c.complex=[];
%-----------------------------------------------------------------------------------
%----------------------���ӷ�ĸ����ʵ��------------------------------------------------------
%----------------------����ʵ��------------------------------------------------------
  if isreal(a) && isreal(b)
      c.complex=0;
         if isa(a,'QD') && isa(b,'QD')
         at=[a.p1 a.p2 a.p3 a.p4];bt=[b.p1 b.p2 b.p3 b.p4];
         ct = div_qd_qd (at,bt);
         c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); c.p4=ct(4);
         elseif isa(a,'QD') && ~isa(b,'QD') 
             if isa(b,'TD')
                at=[a.p1 a.p2 a.p3 a.p4];  
                bt=[part1(b) part2(b)  part3(b)];
                ct = div_qd_td (at, bt);
                c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); c.p4=ct(4);
             elseif isa(b,'DD')
                at=[a.p1 a.p2 a.p3 a.p4];  
                bt=[hi(b) lo(b)];
                ct = div_qd_dd (at, bt);
                c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); c.p4=ct(4);                
             elseif isa(b,'double')
                at=[a.p1 a.p2 a.p3 a.p4]; 
                ct = div_qd_d (at, b);
                c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); c.p4=ct(4);
             else
                error('b is not double nor dd');
             end 
         elseif ~isa(a,'QD') && isa(b,'QD') 
             if isa(a,'TD')|| isa(a,'DD') || isa(a,'double')
                a=QD(a);                
                at=[a.p1 a.p2 a.p3 a.p4];
                bt=[b.p1 b.p2 b.p3 b.p4];
                ct = div_qd_qd (at, bt);
                c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); c.p4=ct(4);
             else
                error('a is not double nor dd');
             end 
         else
             error('a and b both not in QD form');
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
         c.p4=complex(cr.p4,ci.p4);
      end

      
 %--------------------------------------------------------------------------------------
 %--------------------����ʵ������ĸ�Ǹ���---------------------------------------------------
  elseif isreal(a) && ~isreal(b)
      if a==0                      % ����һ��Ϊ0 ��˷�Ϊ0 ���Ǹ�����
         c.complex=0;
         c.p1=0;
         c.p2=0;
         c.p3=0;
         c.p4=0;
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
         c.p4=complex(cr.p4,ci.p4);
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
      c.p4=complex(cr.p4,ci.p4);
     
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
    
  c = class(c,'QD');
  