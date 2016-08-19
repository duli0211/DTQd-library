function c = sqr(a)
%SQR        Implements  a^2  , a is in quad-double format  and a is real
%这个函数不是重载函数
% 
% QD library qd_inline.h  inline qd_real sqr(const qd_real &a)
%    quad-double ^ 2  = (x0 + x1 + x2 + x3) ^ 2
%                     = x0 ^ 2 + 2 x0 * x1 + (2 x0 * x2 + x1 ^ 2)
%                                + (2 x0 * x3 + 2 x1 * x2)          
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%


if a.complex
    c.complex=1;
else
    c.complex=0;
end


  [p0,q0]=TwoSqr(a.p1);
  [p1,q1]=TwoProduct(2.0 * a.p1, a.p2);
  [p2,q2]=TwoProduct(2.0 * a.p1, a.p3);
  [p3,q3]=TwoSqr(a.p2);  
    

  [p1,q0]=TwoSum(p1,q0);

  [q0,q1]=TwoSum(q0,q1);
  [p2,p3]=TwoSum(p2,p3);
  
  [s0,t0]=TwoSum(q0,p2);
  [s1,t1]=TwoSum(q1,p3);  

  [s1,t0]=TwoSum(s1,t0);
  t0=t0+t1;

  [s1,t0]=FastTwoSum(s1,t0);
  [p2,t1]=FastTwoSum(s0,s1);
  [p3,q0]=FastTwoSum(t1,t0);  
   
  p4 = 2.0 * a.p1 * a.p4;
  p5 = 2.0 * a.p2 * a.p3;
  
  [p4,p5]=TwoSum(p4,p5);
  [q2,q3]=TwoSum(q2,q3); 
  
  [t0,t1]=TwoSum(p4,q2); 
  t1 = t1 + p5 + q3;
  
  [p3,p4]=TwoSum(p3,t0); 
  p4 = p4 + q0 + t1;
  
  [c.p1,c.p2,c.p3,c.p4] = quick_renorm(p0,p1,p2,p3,p4);
       
  c = class(c,'QD');




