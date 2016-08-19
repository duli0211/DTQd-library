function res = exp(a)
%EXP          Implements  exp(a)  for triple-double
%
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%
%      Strategy:  We first reduce the size of x by noting that
%      
%           exp(kr + m * log(2)) = 2^m * exp(r)^k
% 
%      where m and k are integers.  By choosing m appropriately
%      we can make |kr| <= log(2) / 2 = 0.347.  Then exp(r) is 
%      evaluated using the familiar Taylor series.  Reducing the 
%      argument substantially speeds up the convergence.        




inv_fact(1)=TD(1.66666666666666657e-01,  9.25185853854297066e-18, 5.13581318503262866e-34);
inv_fact(2)=TD(4.16666666666666644e-02,  2.31296463463574266e-18, 1.28395329625815716e-34);
inv_fact(3)=TD(8.33333333333333322e-03,  1.15648231731787138e-19, 1.60494162032269652e-36);
inv_fact(4)=TD(1.38888888888888894e-03, -5.30054395437357706e-20,  -1.73868675534958776e-36);
inv_fact(5)=TD(1.98412698412698413e-04,  1.72095582934207053e-22, 1.49269123913941271e-40);
inv_fact(6)=TD(2.48015873015873016e-05,  2.15119478667758816e-23, 1.86586404892426588e-41);
inv_fact(7)=TD(2.75573192239858925e-06, -1.85839327404647208e-22, 8.49175460488199287e-39);
inv_fact(8)=TD(2.75573192239858883e-07,  2.37677146222502973e-23, -3.26318890334088294e-40);
inv_fact(9)=TD(2.50521083854417202e-08, -1.44881407093591197e-24, 2.04267351467144546e-41);
inv_fact(10)=TD(2.08767569878681002e-09, -1.20734505911325997e-25,  1.70222792889287100e-42);
inv_fact(11)=TD(1.60590438368216133e-10,  1.25852945887520981e-26,  -5.31334602762985031e-43);
inv_fact(12)=TD(1.14707455977297245e-11,  2.06555127528307454e-28, 6.88907923246664603e-45);
inv_fact(13)=TD(7.64716373181981641e-13,  7.03872877733453001e-30, -7.82753927716258345e-48);
inv_fact(14)=TD(4.77947733238738525e-14,  4.39920548583408126e-31, -4.89221204822661465e-49);
inv_fact(15)=TD(2.81145725434552060e-15,  1.65088427308614326e-31, -2.87777179307447918e-50);



k=1.0 * 2^12;
inv_k=1.0 / k;

if a.complex
    error('we only consider real number now');
else
  if a.p1<-745.0        % reamin 规格化 对应的是709；但是非规格化还能更小2^(-52)数量级。
      res=TD(0);
      return 
  end

  if a.p1>709.0
      res=TD(inf);
      return
  end

  if a==0
      res=TD(1);
      return
  end

  if a==TD(1)
      res=TD('e');
      return
  end

  t1=TD('log2');
  m=floor(a.p1 /t1.p1+0.5);
  r=Mul_pwr2(a-t1.*m,inv_k);
  
  thresh= double(inv_k.*TD('eps'));
  
  p=sqr(r);     %  perform in triple-double form
  s=r+Mul_pwr2(p,0.5);
  

  i=0;t=1;
  while abs(double(t))>thresh && i<9
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
  s = Mul_pwr2(s, 2.0) + sqr(s);             % 这个次数不能多也不能少, 这里要测试到底要几次？！！！！！！！！！！！！！ 2013/01/08
  s = Mul_pwr2(s, 2.0) + sqr(s);            % 我推测是12 因为 9（8） in dd  16 in QD  原因还不明确  8对应k=2^8； 16对应2^16
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);


  s=s+1.0;

  res=Mul_pwr2(s,2^m);
end
% 这个函数的相对误差只能达到10-50




    
    
    


