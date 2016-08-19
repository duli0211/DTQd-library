function s = add_qd_td (a, b)
% addition of  quad-double  and double-double

% P. B. Du & H. Jiang  30/12/2012  NUDT
%    Arguments:       a quad double number a(1),a(2),a(3),a(4)
%                     a triple double number b(1),b(2),b(3)
%    
%    Results:         a quad double number s(1),s(2),s(3),s(4)

%this algorithm is written like add_qd_qd

% first line
[s1,e1]=TwoSum(a(1),b(1));

% second line
[t2,e2]=TwoSum(a(2),b(2));

% third line
[t3,e3]=TwoSum(a(3),b(3));

% fourth line
[s2,u]=TwoSum(e1,t2);
[s3,u,w]=ThreeSums(t3, e2, u);

% third and fourth
[s4,u]=ThreeSums(a(4), e3, u);

s5=u+w;

%renormalize
[s(1),s(2),s(3),s(4)] = quick_renorm( s1,s2,s3,s4,s5);




