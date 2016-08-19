function s = add_td_d (a, b)
% addition algorithm of triple-double and double. see Algorithm for triple-double precision
%floating point arithmetic.
% crlibm-1.0beta4\ triple-double.h \ #define  Add33(resh, resm, resl, ah, am, al, bh, bm, bl) 

% but our method is different from that in crlibm
% their algorithm requires  abs(b) <= 2^(-2) * abs(ah) and other things

%P. B. Du & H. Jiang  31/12/2012  NUDT
%input :a= a1,a2,a3; b;
%output: s= s1,s2,s3;



[t1,e] = TwoSum(a(1), b);
[t2, e] = TwoSum(e,a(2));
[t3, t4] = TwoSum(e,a(3));

[s(1),s(2),s(3)] = quick_renorm( t1,t2,t3,t4);









