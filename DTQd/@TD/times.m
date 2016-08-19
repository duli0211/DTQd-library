function c = times(a,b)
%TIMES        Implements  a .* b  for triple-double
%incluing quad-double, triple-double, double-double,double, real or complex format
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013


if  isa(b,'QD')                       % 第二个参数级别更高 调用更高级别的times 既是 times in QD format
    c=b.*a;                            % a 已经是 DD 不然不会进入这个函数中来
    return
end

  c.complex=[];
%-----------------------------------------------------------------------------------
%----------------------两个实数------------------------------------------------------
  if isreal(a) && isreal(b)
      c.complex=0;
         if isa(a,'TD') && isa(b,'TD')
         at=[a.p1 a.p2 a.p3];bt=[b.p1 b.p2 b.p3];
         ct = prod_td_td (at,bt); 
         c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); 
         elseif isa(a,'TD') && ~isa(b,'TD') 
             if isa(b,'DD')
                at=[a.p1 a.p2 a.p3];  
                bt=[hi(b) lo(b)];
                ct = prod_td_dd (at, bt);
                c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); 
             elseif isa(b,'double')
                at=[a.p1 a.p2 a.p3]; 
                ct = prod_td_d (at, b);
                c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); 
             else
                error('a or b is not double nor DD nor TD');
             end 
         elseif ~isa(a,'TD') && isa(b,'TD') 
             ct=b.*a; 
             c.p1=ct.p1; c.p2=ct.p2; c.p3=ct.p3; 
         else
             error('a and b both not in TD form');
         end 
      



      
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
      
  elseif  isreal(a) && ~isreal(b)      % b is complex; a is real.
      c.complex=1;
      br=real(b);bi=imag(b);
      cr=br.*a;                         % cr is in QD format
      ci=bi.*a;                       % ci should be changed into QD foramt      
      c.p1=complex(cr.p1,ci.p1);
      c.p2=complex(cr.p2,ci.p2);
      c.p3=complex(cr.p3,ci.p3);

  elseif  ~isreal(a) && ~isreal(b)     %a and b are complex
      c.complex=[];
      ar=real(a);ai=imag(a);
      br=real(b);bi=imag(b);
      cr=ar.*br-ai.*bi;                 %quad-double 结构的乘法和减法，加法
      ci=ai.*br+ar.*bi;
      c.p1=complex(cr.p1,ci.p1);
      c.p2=complex(cr.p2,ci.p2);
      c.p3=complex(cr.p3,ci.p3);
      if ci.p1==0                      % 两个复数相乘可能结果为实数  
          c.complex=0;
      else
          c.complex=1;
      end
     
  else
       error('other data format, neithor real or complex');    
  end
  %--------------------------------------------------------------  
    
  %------------------------------------------------------------- 
  %--------------------------------------------------------------  
  
  
      
  c = class(c,'TD');
  