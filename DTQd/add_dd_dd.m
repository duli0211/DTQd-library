function [ rh, rl ] = add_dd_dd (ah, al, bh,bl)
% addition of  double-double  and double-double 

% written  20/11/2012    P. B. Du & H. Jiang
% cited by Design, Implementation and Testing of Extended and Mixed Precision BlLAS
%  

[s1,s2] = TwoSum(ah, bh);
[t1,t2] = TwoSum(al, bl);

s2=s2+t1;

%renormalize (s1,s2) to (t1,s2)
t1=s1+s2;
s2=s2-(t1-s1);

t2=t2+s2;

[rh, rl] = FastTwoSum(t1,t2);
end