function c = sqr(a)
%SQR        Implements  a^2  , a is in triple-double format  and a is real
%这个函数不是重载函数
% 
%    triple-double ^ 2  = (x0 + x1 + x2 ) ^ 2
%                     = x0 ^ 2 + 2 x0 * x1 + (2 x0 * x2 + x1 ^ 2)
%                                + (2 x1 * x2)          
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


 
% four-two sum   inputs: q0 q1 p2 p3 ouputs p2 e
    [q0,q1]=TwoSum(q0,q1);
    [p2,p3]=TwoSum(p2,p3);
    [p2,t1]=TwoSum(p2,q0);
    e=q1+p3+t1;
%-------------------------------------------------    
%似乎不是很精确
  p3 = 2.0 * a.p2 * a.p3+q2+q3+e;
  
  
  [c.p1,c.p2,c.p3] = quick_renorm(p0,p1,p2,p3);
       
  c = class(c,'TD');




