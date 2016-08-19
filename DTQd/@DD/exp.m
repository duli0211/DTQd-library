function res = exp(x)
%EXP          Implements  exp(a)  for double-double
%
% QD library dd_real.cpp  dd_real exp(const dd_real &a)
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%
% /Exponential.  Computes exp(x) in double-double precision. 
% 
%  Strategy:  We first reduce the size of x by noting that
%      
%           exp(kr + m * log(2)) = 2^m * exp(r)^k
% 
% where m and k are integers.  By choosing m appropriately
% we can make |kr| <= log(2) / 2 = 0.347.  Then exp(r) is 
% evaluated using the familiar Taylor series.  Reducing the 
% argument substantially speeds up the convergence. 


% static const dd_real inv_fact[n_inv_fact] 常数设置   %一直不知道为什么这个数值有效位要比matlab长几位？

inv_fact(1)=DD(1.66666666666666657e-01,  9.25185853854297066e-18);
inv_fact(2)=DD(4.16666666666666644e-02,  2.31296463463574266e-18);
inv_fact(3)=DD(8.33333333333333322e-03,  1.15648231731787138e-19);
inv_fact(4)=DD(1.38888888888888894e-03, -5.30054395437357706e-20);
inv_fact(5)=DD(1.98412698412698413e-04,  1.72095582934207053e-22);
inv_fact(6)=DD(2.48015873015873016e-05,  2.15119478667758816e-23);
inv_fact(7)=DD(2.75573192239858925e-06, -1.85839327404647208e-22);
inv_fact(8)=DD(2.75573192239858883e-07,  2.37677146222502973e-23);
inv_fact(9)=DD(2.50521083854417202e-08, -1.44881407093591197e-24);
inv_fact(10)=DD(2.08767569878681002e-09, -1.20734505911325997e-25);
inv_fact(11)=DD(1.60590438368216133e-10,  1.25852945887520981e-26);
inv_fact(12)=DD(1.14707455977297245e-11,  2.06555127528307454e-28);
inv_fact(13)=DD(7.64716373181981641e-13,  7.03872877733453001e-30);
inv_fact(14)=DD(4.77947733238738525e-14,  4.39920548583408126e-31);
inv_fact(15)=DD(2.81145725434552060e-15,  1.65088427308614326e-31);

if isreal(x)
    a=x;
else
    a=real(x);
    b=imag(x);
end

  if a.hi<-745        % reamin 规格化 对应的是709；但是非规格化还能更小2^(-52)数量级。
      r=DD(0);
      if isreal(x)
          res=r;
      return 
      end
  end

  if a.hi>709
      r=DD(inf);
      if isreal(x)
          res=r;
      return 
      end
  end

  if iszero(a)
      r=DD(1);
      if isreal(x)
          res=r;
      return 
      end
  end

  if a==DD(1)
      r=DD('e');
      if isreal(x)
          res=r;
      return 
      end
  end

  k=1.0*2^9;
  inv_k=1.0/k;
  t1=DD('log2');
  m=floor(a.hi/t1.hi+0.5);
  r=Mul_pwr2(a-t1.*m,inv_k);

  p=sqr(r);     %  perform in double-double form
  s=r+Mul_pwr2(p,0.5);
  

  i=0;t=1;
  while abs(double(t))>double(inv_k.*DD('eps')) && i<5
      p=p.*r;
      t=p.*inv_fact(i+1);
      i=i+1;
      s=s+t;
  end


  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);             % 这个次数不能多也不能少


  s=s+1.0;

  r=Mul_pwr2(s,2^m);
      if isreal(x)
          res=r;  % 这个函数的相对误差只能达到10-28
      else
          r2=cos(b)+DD(1i).*sin(b);
          res=r.*r2;
      end




    
    
    


