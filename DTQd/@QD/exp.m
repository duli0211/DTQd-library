function res = exp(a)
%EXP          Implements  exp(a)  for quad-double
%
% QD library qd_real.cpp  qd_real exp(const qd_real &a) 
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




inv_fact(1)=QD(1.66666666666666657e-01,  9.25185853854297066e-18, 5.13581318503262866e-34,  2.85094902409834186e-50);
inv_fact(2)=QD(4.16666666666666644e-02,  2.31296463463574266e-18, 1.28395329625815716e-34,  7.12737256024585466e-51);
inv_fact(3)=QD(8.33333333333333322e-03,  1.15648231731787138e-19, 1.60494162032269652e-36,  2.22730392507682967e-53);
inv_fact(4)=QD(1.38888888888888894e-03, -5.30054395437357706e-20,  -1.73868675534958776e-36, -1.63335621172300840e-52);
inv_fact(5)=QD(1.98412698412698413e-04,  1.72095582934207053e-22, 1.49269123913941271e-40,  1.29470326746002471e-58);
inv_fact(6)=QD(2.48015873015873016e-05,  2.15119478667758816e-23, 1.86586404892426588e-41,  1.61837908432503088e-59);
inv_fact(7)=QD(2.75573192239858925e-06, -1.85839327404647208e-22, 8.49175460488199287e-39, -5.72661640789429621e-55);
inv_fact(8)=QD(2.75573192239858883e-07,  2.37677146222502973e-23, -3.26318890334088294e-40,  1.61435111860404415e-56);
inv_fact(9)=QD(2.50521083854417202e-08, -1.44881407093591197e-24, 2.04267351467144546e-41, -8.49632672007163175e-58);
inv_fact(10)=QD(2.08767569878681002e-09, -1.20734505911325997e-25,  1.70222792889287100e-42,  1.41609532150396700e-58);
inv_fact(11)=QD(1.60590438368216133e-10,  1.25852945887520981e-26,  -5.31334602762985031e-43,  3.54021472597605528e-59);
inv_fact(12)=QD(1.14707455977297245e-11,  2.06555127528307454e-28, 6.88907923246664603e-45,  5.72920002655109095e-61);
inv_fact(13)=QD(7.64716373181981641e-13,  7.03872877733453001e-30, -7.82753927716258345e-48,  1.92138649443790242e-64);
inv_fact(14)=QD(4.77947733238738525e-14,  4.39920548583408126e-31, -4.89221204822661465e-49,  1.20086655902368901e-65);
inv_fact(15)=QD(2.81145725434552060e-15,  1.65088427308614326e-31, -2.87777179307447918e-50,  4.27110689256293549e-67);



k=1.0 * 2^16;
inv_k=1.0 / k;

if a.complex
    error('we only consider real number now');
else
  if a.p1<-745.0        % reamin ��� ��Ӧ����709�����Ƿǹ�񻯻��ܸ�С2^(-52)��������
      res=QD(0);
      return 
  end

  if a.p1>709.0
      res=QD(inf);
      return
  end

  if a==0
      res=QD(1);
      return
  end

  if a==QD(1)
      res=QD('e');
      return
  end

  t1=QD('log2');
  m=floor(a.p1 /t1.p1+0.5);
  r=Mul_pwr2(a-t1.*m,inv_k);
  
  thresh= double(inv_k.*QD('eps'));
  
  p=sqr(r);     %  perform in double-double form
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
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);             % ����������ܶ�Ҳ������
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);
  s = Mul_pwr2(s, 2.0) + sqr(s);

  s=s+1.0;

  res=Mul_pwr2(s,2^m);
end
% ���������������ֻ�ܴﵽ10-66




    
    
    


