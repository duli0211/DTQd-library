function s = add_qd_qd(a, b)
% addition algorithm of two quad-double numbers. see Algorithm for Quad-double precision
%floating point arithmetic.

% a little different from that in QD library

% P. B. Du & H. Jiang 2010 08 03
%input :a= a0,a1,a2,a3; b=b0,b1,b2,b3;
%output: s= s0,s1,s2,s3;

t=zeros(1,5);
e=zeros(1,4);
u=zeros(1,4);


[t(0+1),e(0+1)]=TwoSum(a(0+1),b(0+1));
[t(1+1),e(1+1)]=TwoSum(a(1+1),b(1+1));
[t(2+1),e(2+1)]=TwoSum(a(2+1),b(2+1));
[t(3+1),e(3+1)]=TwoSum(a(3+1),b(3+1));


[t(1+1),u(1+1)]=TwoSum(t(1+1),e(0+1));

[t(2+1), u(2+1), w ]=ThreeSums(t(2+1), e(1+1), u(1+1));

[t(3+1), u(3+1) ]=ThreeSums(t(3+1), e(2+1), u(2+1));

t(4+1)=ThreeSums(e(3+1), u(3+1), w);

%s = Renormalize( t );
% test 上面的tenormalize是Prest的程序，Rump也用过， 下面的renorm是QD中的程序，
% 两个程序的结果看上去不一样但是用sym函数计算的结果显示是一样的。
% 原因还不清楚 要继续研究  HJ  2012/12/31

[s(1),s(2),s(3),s(4)] = quick_renorm( t(1),t(2),t(3),t(4),t(5));

end

