function s = add_td_dd (a, b)
% addition algorithm of triple-double and double. 
% crlibm-1.0beta4\ triple-double.h 
% #define  Add233(resh, resm, resl, ah, al, bh, bm, bl)    
% #define  Add233Cond(resh, resm, resl, ah, al, bh, bm, bl)  
% but our method is different from that in crlibm
% their algorithm requires  preconditions.

% P. B. Du & H. Jiang  30/12/2012  NUDT
%    Arguments:       a triple double number a(1), a(2),a(3)
%                     a double double number b(1),b(2)
%    
%    Results:         a triple double number s(1),s(2),s(3)

%this algorithm is written like add_qd_qd

% first line
[s1,t1]=TwoSum(a(1),b(1));

% second line
[t2,t3]=TwoSum(a(2),b(2));
[t4,t5]=TwoSum(a(3),t3);

% third line
[s2,t6]=TwoSum(t1,t2);
[s3,t7]=TwoSum(t4,t6);

s4=t5+t7;

%renormalize
[s(1),s(2),s(3)] = quick_renorm( s1,s2,s3,s4);




