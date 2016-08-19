function s = add_qd_d (a, b)
% addition of  quad-double  and double
% a: quad-double number
% b: double number
% 不知道对不对 最后证明是一样的。
% QD library qd_inline.h ,quad-double + double ,inline qd_real operator+(const qd_real &a, double b)
%参见 文献 Algorithm for Quad-Double Precision Floatling Point Arithmetric

% t=zeros(1,5);
% 
% [t(1),r1] = TwoSum(a(0+1), b);
% [t(2), r2] = TwoSum(r1,a(1+1));
% [t(3), r3] = TwoSum(r2,a(2+1));
% [t(4), t(5)] = TwoSum(r3,a(3+1));
% 
% 
% s = Renormalize( t );

% 31/12/2012  P. B. Du & H. Jiang  revision  NUDT

[t1,e] = TwoSum(a(1), b);
[t2, e] = TwoSum(e,a(2));
[t3, e] = TwoSum(e,a(3));
[t4, t5] = TwoSum(e,a(4));

[s(1),s(2),s(3),s(4)] = quick_renorm( t1,t2,t3,t4,t5);


