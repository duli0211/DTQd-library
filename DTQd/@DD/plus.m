function c = plus(a,b)
%PLUS         Implements  a + b  for double-double 
%incluing double-double, double, real or complex format
%

% written by P. B. Du & H. Jiang NUDT 07/01/2013



if  isa(b,'QD')                       % 第二个参数级别更高 调用更高级别的plus 既是 plus in QD format
    c=b+a;                            % a 已经是 DD 不然不会进入这个函数中来
    return
end

if  isa(b,'TD')                       % 第二个参数级别更高 调用更高级别的plus 既是 plus in TD format
    c=b+a;                            % a 已经是 DD 不然不会进入这个函数中来
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
%       elseif a.double==1 && b.double==1               % 这个时候其实就是两个double运算，要提前把doubel转化为double-double
%          [ c.hi, c.lo ] = TwoSum(a.hi,b.hi);
      else
          disp('other data format, neithor double nor double-double');
      end 

  elseif  ~isreal(a) && ~isreal(b)     %a and b are complex
      c.complex=[];
      ar=real(a);ai=imag(a);
      br=real(b);bi=imag(b);
      cr=ar+br;                        % 相当于调用上面两个都是实数的情况了；加法中虚数和实数的运算相互独立。
      ci=ai+bi;                        % 这里cr和ci为DD类的结构体形式
      c.hi=complex(cr.hi,ci.hi);
      c.lo=complex(cr.lo,ci.lo);
      
      if ci.hi==0                      % 两个复数相加可能结果为实数 此时必有 ci.lo=0  
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
  

