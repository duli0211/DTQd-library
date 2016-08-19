function c = times(a,b)
%TIMES        Implements  a .* b  for double-double
%incluing double-double, double, real or complex format
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013


if  isa(b,'TD')                       % 第二个参数级别更高 调用更高级别的times 既是 times in TD format
    c=b.*a;                            % a 已经是 DD 不然不会进入这个函数中来
    return
end

if  isa(b,'QD')                       % 第二个参数级别更高 调用更高级别的times 既是 times in QD format
    c=b.*a;                            % a 已经是 DD 不然不会进入这个函数中来
    return
end



%-----------------------------------------------------------------------------------
%----------------------两个实数------------------------------------------------------
  if isreal(a) && isreal(b)
      c.complex=0;
      if a==0 || b==0         % 其中一个为0 则乘法为0 不是复数。
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
%            elseif a.double==1 && b.double==1                % 这个时候其实就是两个double运算，要提前把doubel转化为double-double
%               [ c.hi, c.lo ] = TwoProduct(a.hi,b.hi);
           else
              error('other data format, neithor double nor double-double');
           end 
      end
  
%-------------------------------------------------------------------------------------
%--------------------一个复数一个实数---------------------------------------------------
  elseif ~isreal(a) && isreal(b)         % 当只有一个数是复数的时候可以看做两个不相关的部分的计算；
         c.complex=1;
         ar=real(a);ai=imag(a);
         cr=ar.*b;                        % 相当于调用上面两个都是实数的情况了；加法中虚数和实数的运算相互独立。
         ci=ai.*b;
         c.hi=complex(cr.hi,ci.hi);
         c.lo=complex(cr.lo,ci.lo);
      
 %--------------------------------------------------------------------------------------
 %--------------------一个复数一个实数---------------------------------------------------
  elseif isreal(a) && ~isreal(b)
      if iszero(a)                       % 其中一个为0 则乘法为0 不是复数。
         c.complex=0;
         c.hi=0;
         c.lo=0;
      else
         c.complex=1;
         br=real(b);bi=imag(b);
         cr=br.*a;                        % 相当于调用上面两个都是实数的情况了；加法中虚数和实数的运算相互独立。
         ci=bi.*a;
         c.hi=complex(cr.hi,ci.hi);
         c.lo=complex(cr.lo,ci.lo);
      end

      
  %------------------------------------------------------------------------------- 
  %--------------------两个复数---------------------------------------------------
  elseif  ~isreal(a) && ~isreal(b)     %a and b are complex
      c.complex=[];
      ar=real(a);ai=imag(a);
      br=real(b);bi=imag(b); 
      cr=ar.*br-ai.*bi;                 %double-double 结构的乘法和减法，加法
      ci=ai.*br+ar.*bi;
      c.hi=complex(cr.hi,ci.hi);
      c.lo=complex(cr.lo,ci.lo);   
     
   %-----------------------------------------------------------------------------   
      if ci.hi==0 && ci.lo==0            % 两个复数相乘可能结果为实数   
          c.complex=0;
      else
          c.complex=1;
      end
  else
       error('other data format, neithor real or complex');    
  end
   
  %------------------------------------------------------------------------------
      
  c = class(c,'DD');
  