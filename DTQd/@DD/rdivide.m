function c = rdivide(a,b)
%MLDIVIDE     Implements  a ./ b
%

% written by P. B. Du & H. Jiang NUDT 07/01/2013


if  isa(b,'QD')                       % 第二个参数级别更高 调用更高级别的 in QD format
    a=QD(a);
    c=a./b;                           % a 已经是 DD 不然不会进入这个函数中来 把a变成QD形式调用QD的除法
    return
end

if  isa(b,'TD')                       % 第二个参数级别更高 调用更高级别的 in TD format
    a=TD(a);
    c=a./b;                           % a 已经是 DD 不然不会进入这个函数中来 把a变成TD形式调用TD的除法
    return
end



%-----------------------------------------------------------------------------------
%----------------------分子分母都是实数------------------------------------------------------
  if isreal(a) && isreal(b)
      c.complex=0;
      if b==0
         error('the denominator can not be 0');
      elseif a==0        % 其中一个为0 则乘法为0 不是复数。
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
%            elseif a.double==1 && b.double==1                    % 这个时候其实就是两个double运算，要提前把doubel转化为double-double
%               [ c.hi, c.lo ] = Div_d_d(a.hi,b.hi);
           else
              error('other data format, neithor double nor double-double');
           end 
      end
  
%-------------------------------------------------------------------------------------
%--------------------分子复数，分母是实数---------------------------------------------------
  elseif ~isreal(a) && isreal(b)         % 当只有一个数是复数的时候可以看做两个不相关的部分的计算；
      if iszero(b)
         error('the denominator can not be 0');
      else
         c.complex=1;
         ar=real(a);ai=imag(a);
         cr=ar./b;                        % 相当于调用上面两个都是实数的情况了；加法中虚数和实数的运算相互独立。
         ci=ai./b;
         c.hi=complex(cr.hi,ci.hi);
         c.lo=complex(cr.lo,ci.lo);
      end

      
 %--------------------------------------------------------------------------------------
 %--------------------分子实数，分母是复数---------------------------------------------------
  elseif isreal(a) && ~isreal(b)
      if iszero(a)                       % 其中一个为0 则乘法为0 不是复数。
         c.complex=0;
         c.hi=0;
         c.lo=0;
      else
         c.complex=1;
         br=real(b);bi=imag(b);     
         t1=a.*br;                       % 相当于调用上面两个都是实数的情况了；加法中虚数和实数的运算相互独立。
         t2=-a.*bi;
         t3=br.*br+bi.*bi;
         cr=t1./t3;
         ci=t2./t3;
         c.hi=complex(cr.hi,ci.hi);
         c.lo=complex(cr.lo,ci.lo);
      end

      
  %------------------------------------------------------------------------------- 
  %--------------------分子分母都是复数---------------------------------------------------
  elseif  ~isreal(a) && ~isreal(b)     %a and b are complex
      c.complex=[];
      ar=real(a);ai=imag(a);
      br=real(b);bi=imag(b); 
      t1=ar.*br+ai.*bi;                 % double-double 结构的乘法和减法，加法
      t2=ai.*br-ar.*bi;
      t3=br.*br+bi.*bi;
      cr=t1./t3;
      ci=t2./t3;    
      c.hi=complex(cr.hi,ci.hi);
      c.lo=complex(cr.lo,ci.lo);   
     
   %-----------------------------------------------------------------------------   
      if hi(ci)==0  && lo(ci)==0                    % 两个复数相除可能结果为实数， 
          c.complex=0;
      else
          c.complex=1;
      end
  else
       error('other data format, neithor real or complex');    
  end
   
  %------------------------------------------------------------------------------

      
  c = class(c,'DD');
  