function c = plus(a,b)
%PLUS         Implements  a + b  for quad-double 
%incluing double-double, double, real or complex format
%

% written by P. B. Du & H. Jiang NUDT 07/01/2013


                        
% ��ʼ��ʱ�򶼳�ʼ��Ϊquad-double��ʽ�����ԭ����double, ��ô���ɵ�QD��ʽ *.double=1  ���ԭ����double-double, ��ô���ɵ�QD��ʽ *.dd=1; 
% ����������ԭ����Ȼ��QDģʽ���Ǳ����Ǽ򻯵�double��double-double  �����Ĳ���Ҫ������
% ������������Ͼ������� ���󲿷������ qd+qd qd+dd  qd+d  Ҳ����˵qdģʽ�еı�����dd����dģʽ�������١�
% �������ǻ�����isa������֧������a.double a.dd ������֧��





  if isreal(a) && isreal(b)
      c.complex=0;   
      if isa(a,'QD') && isa(b,'QD')
         at=[a.p1 a.p2 a.p3 a.p4];bt=[b.p1 b.p2 b.p3 b.p4];
         ct = add_qd_qd (at,bt);
         c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); c.p4=ct(4);
      elseif isa(a,'QD') && ~isa(b,'QD') 
          if isa(b,'TD')
              at=[a.p1 a.p2 a.p3 a.p4]; bt=[part1(b) part2(b) part3(b)];
              ct = add_qd_td (at, bt);
              c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); c.p4=ct(4);
          elseif isa(b,'DD')
              at=[a.p1 a.p2 a.p3 a.p4]; bt=[hi(b) lo(b)];
              ct = add_qd_dd (at, bt);
              c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); c.p4=ct(4);
          elseif isa(b,'double')
              at=[a.p1 a.p2 a.p3 a.p4]; 
              ct = add_qd_d (at, b);
              c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); c.p4=ct(4);
          else
              error('a or b is not double nor dd nor QD');
          end 
      elseif ~isa(a,'QD') && isa(b,'QD') 
          ct=b+a; 
          c.p1=ct.p1; c.p2=ct.p2; c.p3=ct.p3; c.p4=ct.p4;
      else
          error('a and b both not in QD form');
      end 

  elseif  ~isreal(a) && ~isreal(b)     %a and b are complex
      c.complex=[];
      ar=real(a);ai=imag(a);
      br=real(b);bi=imag(b);
      cr=ar+br;                        % �൱�ڵ���������������ʵ��������ˣ��ӷ���������ʵ���������໥������
      ci=ai+bi;                        % ����cr��ciΪQD��Ľṹ����ʽ
      c.p1=complex(cr.p1,ci.p1);
      c.p2=complex(cr.p2,ci.p2);
      c.p3=complex(cr.p3,ci.p3);
      c.p4=complex(cr.p4,ci.p4);
      
      if ci.p1==0                      % ����������ӿ��ܽ��Ϊʵ�� 
          c.complex=0;
      else
          c.complex=1;
      end
  elseif ~isreal(a) && isreal(b)       % a is complex; b is real.
      c.complex=1;
      ar=real(a);ai=imag(a);
      cr=ar+b;
      ci=QD(ai);
      c.p1=complex(cr.p1,ci.p1);
      c.p2=complex(cr.p2,ci.p2);
      c.p3=complex(cr.p3,ci.p3);
      c.p4=complex(cr.p4,ci.p4);
      
  elseif  isreal(a) && ~isreal(b)      % b is complex; a is real.
      c.complex=1;
      br=real(b);bi=imag(b);
      cr=br+a;                         % cr is in QD format
      ci=QD(bi);                       % ci should be changed into QD foramt      
      c.p1=complex(cr.p1,ci.p1);
      c.p2=complex(cr.p2,ci.p2);
      c.p3=complex(cr.p3,ci.p3);
      c.p4=complex(cr.p4,ci.p4);
  else
       error('other data format, neithor real or complex');    
  end
  
  
  %--------------------------------------------------------------
      
  
  
  
  
  
  %--------------------------------------------------------------  
      
  c = class(c,'QD');
  

