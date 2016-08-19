function c = DDrand(a)
%RAND   generate random real number in double-double format
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% 自己构造的 不知道合理性分布如何
if a==DD(1)
c.complex=0;
c.hi=rand();
c.lo=rand().*2^(-53);  %后移动位置
[c.hi,c.lo]=FastTwoSum(c.hi,c.lo);
c = class(c,'DD');
else
  error('other case will be  considered later');  
end

