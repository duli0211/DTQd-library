function c = rdivide(a,b)
%MLDIVIDE     Implements  a ./ b
%

% written by P. B. Du & H. Jiang NUDT 07/01/2013





if  isa(b,'QD')                       % 第二个参数级别更高 调用更高级别的 in QD format
    a=QD(a);
    c=a./b;                           % a 已经是 TD 不然不会进入这个函数中来 把a变成QD形式调用QD的除法
    return
end


  c.complex=[];
%-----------------------------------------------------------------------------------
%----------------------分子分母都是实数------------------------------------------------------
%----------------------两个实数------------------------------------------------------
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
%--------------------分子复数，分母是实数---------------------------------------------------
  elseif ~isreal(a) && isreal(b)         % 当只有一个数是复数的时候可以看做两个不相关的部分的计算；
      if iszero(b)
         error('the denominator can not be 0');
      else
         c.complex=1;
         ar=real(a);ai=imag(a);
         cr=ar./b;                        % 相当于调用上面两个都是实数的情况了；加法中虚数和实数的运算相互独立。
         ci=ai./b;
         c.p1=complex(cr.p1,ci.p1);
         c.p2=complex(cr.p2,ci.p2);
         c.p3=complex(cr.p3,ci.p3);
      end

      
 %--------------------------------------------------------------------------------------
 %--------------------分子实数，分母是复数---------------------------------------------------
  elseif isreal(a) && ~isreal(b)
      if a==0                      % 其中一个为0 则乘法为0 不是复数。
         c.complex=0;
         c.p1=0;
         c.p2=0;
         c.p3=0;
      else
         c.complex=1;
         br=real(b);bi=imag(b);     
         t1=a.*br;                       % 相当于调用上面两个都是实数的情况了；加法中虚数和实数的运算相互独立。
         t2=-a.*bi;
         t3=br.*br+bi.*bi;
         cr=t1./t3;
         ci=t2./t3;
         c.p1=complex(cr.p1,ci.p1);
         c.p2=complex(cr.p2,ci.p2);
         c.p3=complex(cr.p3,ci.p3);
      end

      
  %------------------------------------------------------------------------------- 
  %--------------------分子分母都是复数---------------------------------------------------
  elseif  ~isreal(a) && ~isreal(b)     %a and b are complex
      c.complex=[];
      ar=real(a);ai=imag(a);
      br=real(b);bi=imag(b); 
      t1=ar.*br+ai.*bi;                 % quad-double 结构的乘法和减法，加法
      t2=ai.*br-ar.*bi;
      t3=br.*br+bi.*bi;
      cr=t1./t3;
      ci=t2./t3;    
      c.p1=complex(cr.p1,ci.p1);
      c.p2=complex(cr.p2,ci.p2);
      c.p3=complex(cr.p3,ci.p3);
     
   %-----------------------------------------------------------------------------   
      if  ci.p1==0                      % 两个复数相除法可能结果为实数  
          c.complex=0;
      else
          c.complex=1;
      end
  else
       error('other data format, neithor real or complex');    
  end
   
  %------------------------------------------------------------- 
    
  c = class(c,'TD');
  