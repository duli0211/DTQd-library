function c = plus(a,b)
%PLUS         Implements  a + b  for triple-double 
%incluing quad-double triple-double double-double, double, real or complex format
%but a or b must be in triple-double format

% written by P. B. Du & H. Jiang NUDT 07/01/2013

if  isa(b,'QD')                       % 第二个参数级别更高 调用更高级别的plus 既是 plus in QD format
    c=b+a;                            % a 已经是 DD 不然不会进入这个函数中来
    return
end


  if isreal(a) && isreal(b)
      c.complex=0;   
      if isa(a,'TD') && isa(b,'TD')
         at=[a.p1 a.p2 a.p3];bt=[b.p1 b.p2 b.p3];
         ct = add_td_td (at,bt);
         c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); 
      elseif isa(a,'TD') && ~isa(b,'TD') 
          if isa(b,'DD')
              at=[a.p1 a.p2 a.p3 ]; bt=[hi(b) lo(b)];
              ct = add_td_dd (at, bt);
              c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); 
          elseif isa(b,'double')
              at=[a.p1 a.p2 a.p3]; 
              ct = add_td_d (at, b);
              c.p1=ct(1); c.p2=ct(2); c.p3=ct(3); 
          else
              error('a or b is not double nor dd nor triple-double');
          end 
      elseif ~isa(a,'TD') && isa(b,'TD') 
          ct=b+a; 
          c.p1=ct.p1; c.p2=ct.p2; c.p3=ct.p3; 
      else
          error('a and b both not in TD form');
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
           
      if ci.p1==0                      % 两个复数相加可能结果为实数 
          c.complex=0;
      else
          c.complex=1;
      end
  elseif ~isreal(a) && isreal(b)       % a is complex; b is real.
      c.complex=1;
      ar=real(a);ai=imag(a);
      cr=ar+b;
      ci=TD(ai);
      c.p1=complex(cr.p1,ci.p1);
      c.p2=complex(cr.p2,ci.p2);
      c.p3=complex(cr.p3,ci.p3);
      
      
  elseif  isreal(a) && ~isreal(b)      % b is complex; a is real.
      c.complex=1;
      br=real(b);bi=imag(b);
      cr=br+a;                         % cr is in QD format
      ci=TD(bi);                       % ci should be changed into TD foramt      
      c.p1=complex(cr.p1,ci.p1);
      c.p2=complex(cr.p2,ci.p2);
      c.p3=complex(cr.p3,ci.p3);
  else
       error('other data format, neithor real or complex');    
  end
  
  
  %------------------------------------------------------------- 

  %--------------------------------------------------------------  
      
  c = class(c,'TD');
  

