function c = DDrand(a)
%RAND   generate random real number in double-double format
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% �Լ������ ��֪�������Էֲ����
if a==DD(1)
c.complex=0;
c.hi=rand();
c.lo=rand().*2^(-53);  %���ƶ�λ��
[c.hi,c.lo]=FastTwoSum(c.hi,c.lo);
c = class(c,'DD');
else
  error('other case will be  considered later');  
end

