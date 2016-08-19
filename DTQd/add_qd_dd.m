function s = add_qd_dd (a, b)
% addition of  quad-double  and double-double
% a: quad-double number  a= [a1 a2 a3 a4]
% b: doubl-double number  b=[b1 b2]
% QD libray   qd_inline.h  /* quad-double + double-double */
% inline qd_real operator+(const qd_real &a, const dd_real &b) 
% P. B. Du & H. Jiang 2012/12/17  NUDT




[s(1), t1] = TwoSum(a(1), b(1));
[s(2), t2] = TwoSum(a(2), b(2));

[s(2), t1] = TwoSum(s(2), t1);

%s(3)=a(3);

[s(3), t1, t2]=ThreeSums(a(3), t1, t2);

[s(4), t1] = TwoSum(t1,a(4));
t1=t1+t2;

[s(1),s(2),s(3),s(4)] = quick_renorm(s(1),s(2),s(3),s(4),t1);

end

