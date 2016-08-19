function s = add_td_td (a, b)
% addition algorithm of two triple-double numbers. see Algorithm for triple-double precision
%floating point arithmetic.
% crlibm-1.0beta4\ triple-double.h 
% #define  Add33(resh, resm, resl, ah, am, al, bh, bm, bl) 
% #define  Add33Cond(resh, resm, resl, ah, am, al, bh, bm, bl)
% but our method is different from that in crlibm
% their algorithm requires  abs(b) <= 2^(-2) * abs(ah) and other things

%P. B. Du & H. Jiang  30/12/2012  NUDT
%input :a= a1,a2,a3; b=b1,b2,b3;
%output: s= s1,s2,s3;

%this algorithm computing the final part is not accuratly, it is like the
%sloppy method. if we want more accurate, we need to compute the four parts
%and later using renormalizing.
% 
% [s1,t1]=TwoSum(a(1),b(1));
% [t2,t3]=TwoSum(a(2),b(2));
% 
% t5=a(3)+b(3);
% [s2,t4]=TwoSum(t1,t2);
% s3=t3+t4+t5;
% 
% 
% 
% %renormalize
% [s(1),s(2),s(3)] = renorm( s1,s2,s3 );

% the following is accurate method

[s1,t1]=TwoSum(a(1),b(1));
[t2,t3]=TwoSum(a(2),b(2));
[t4,t5]=TwoSum(a(3),b(3));

[s2,t6]=TwoSum(t1,t2);

[s3,t7]  = ThreeSums( t3,t4,t6 );

s4=t5+t7;


%renormalize
[s(1),s(2),s(3)] = quick_renorm( s1,s2,s3,s4);




