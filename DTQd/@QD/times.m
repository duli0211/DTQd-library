function c = times(a,b)
%TIMES        Implements  a .* b  for quad-double
%incluing quad-double, double-double,double, real or complex format
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013



  c.complex=[];
%-----------------------------------------------------------------------------------
%----------------------两个实数------------------------------------------------------
  if isreal(a) && isreal(b)
      c.complex=0;
%       if a==0 || b==0         % 其中一个为0 则乘法为0 不是复数。
%          c.p1=0;c.p2=0;c.p3=0;c.p4=0;
%       else
         if isa(a,'QD') && isa(b,'QD')
         at=[a.p1 a.p2 a.p3 a.p4];bt=[b.p1 b.p2 b.p3 b.p4];
         ct = prod_qd_qd (at,bt);
         c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); c.p4=ct(4);
         elseif isa(a,'QD') && ~isa(b,'QD') 
             if isa(b,'TD')
                at=[a.p1 a.p2 a.p3 a.p4];  
                bt=[part1(b) part2(b) part3(b)];
                ct = prod_qd_td (at, bt);
                c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); c.p4=ct(4);             
             elseif isa(b,'DD')
                at=[a.p1 a.p2 a.p3 a.p4];  
                bt=[hi(b) lo(b)];
                ct = prod_qd_dd (at, bt);
                c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); c.p4=ct(4);  
             elseif isa(b,'double')
                at=[a.p1 a.p2 a.p3 a.p4]; 
                ct = prod_qd_d (at, b);
                c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); c.p4=ct(4);
             else
                error('a or b is not double nor dd nor QD');
             end 
         elseif ~isa(a,'QD') && isa(b,'QD') 
             ct=b.*a; 
             c.p1=ct.p1; c.p2=ct.p2; c.p3=ct.p3; c.p4=ct.p4;
         else
             error('a and b both not in QD form');
         end 
      
%-------------------------------------------------------------------------------------
%--------------------一个复数一个实数---------------------------------------------------


      
 %--------------------------------------------------------------------------------------
 %--------------------一个复数一个实数---------------------------------------------------
 elseif ~isreal(a) && isreal(b)       % a is complex; b is real.
      c.complex=1;
      ar=real(a);ai=imag(a);
      cr=ar.*b;
      ci=ai.*b;
      c.p1=complex(cr.p1,ci.p1);
      c.p2=complex(cr.p2,ci.p2);
      c.p3=complex(cr.p3,ci.p3);
      c.p4=complex(cr.p4,ci.p4);
      
  elseif  isreal(a) && ~isreal(b)      % b is complex; a is real.
      c.complex=1;
      br=real(b);bi=imag(b);
      cr=br.*a;                         % cr is in QD format
      ci=bi.*a;                       % ci should be changed into QD foramt      
      c.p1=complex(cr.p1,ci.p1);
      c.p2=complex(cr.p2,ci.p2);
      c.p3=complex(cr.p3,ci.p3);
      c.p4=complex(cr.p4,ci.p4);
  elseif  ~isreal(a) && ~isreal(b)     %a and b are complex
      c.complex=[];
      ar=real(a);ai=imag(a);
      br=real(b);bi=imag(b);
      cr=ar.*br-ai.*bi;                 %quad-double 结构的乘法和减法，加法
      ci=ai.*br+ar.*bi;
      c.p1=complex(cr.p1,ci.p1);
      c.p2=complex(cr.p2,ci.p2);
      c.p3=complex(cr.p3,ci.p3);
      c.p4=complex(cr.p4,ci.p4);
      if ci.p1==0                      % 两个复数相乘可能结果为实数  
          c.complex=0;
      else
          c.complex=1;
      end
     
  else
       error('other data format, neithor real or complex');    
  end
  %--------------------------------------------------------------  
      
  c = class(c,'QD');
  