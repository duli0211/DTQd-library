function c = plus(a,b)
%PLUS         Implements  a + b  for quad-double 
%incluing double-double, double, real or complex format
%

% written by P. B. Du & H. Jiang NUDT 07/01/2013


                        
% 开始的时候都初始化为quad-double形式，如果原来是double, 那么生成的QD形式 *.double=1  如果原来是double-double, 那么生成的QD形式 *.dd=1; 
% 这样避免了原来虽然是QD模式但是本身是简化的double和double-double  带来的不必要的运算
% 但是这种情况毕竟是少数 绝大部分情况是 qd+qd qd+dd  qd+d  也就是说qd模式中的本质是dd或者d模式的数很少。
% 所以我们还是用isa来做分支，不用a.double a.dd 等做分支。





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
      cr=ar+br;                        % 相当于调用上面两个都是实数的情况了；加法中虚数和实数的运算相互独立。
      ci=ai+bi;                        % 这里cr和ci为QD类的结构体形式
      c.p1=complex(cr.p1,ci.p1);
      c.p2=complex(cr.p2,ci.p2);
      c.p3=complex(cr.p3,ci.p3);
      c.p4=complex(cr.p4,ci.p4);
      
      if ci.p1==0                      % 两个复数相加可能结果为实数 
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
  

