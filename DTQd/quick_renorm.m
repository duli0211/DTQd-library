function [c1,c2,c3,c4] = quick_renorm(c1,c2,c3,c4,c5)
%  QD librcry qd_inline.h inline void quick_renorm
%  ���������Renormalize.m ���һ����renorm��ͬ���е�ʱ�����Խ���һ������������á�
% Ҫ�������c1����ҪԪ�أ�overlap����̫���������Ŀǰ��û������֤����
% written by P. B. Du & H. Jiang NUDT 07/01/2013
if isinf(c1)
    disp('c1 is inf or -inf');
    c2=0;c3=0;c4=0;
   return
end

if nargin==3 
    [s,t2] = FastTwoSum(c2,c3);
    [c1,t1] = FastTwoSum(c1,s);
    [c2,c3] = FastTwoSum(t1,t2);
end

if nargin==4  
    [s,t3] = FastTwoSum(c3,c4);
    [s,t2] = FastTwoSum(c2,s);
    [c1,t1] = FastTwoSum(c1,s);
    
    [s,t2] = FastTwoSum(t2,t3);
    [c2,t1] = FastTwoSum(t1,s);
    
    [c3,c4] = FastTwoSum(t1,t2);
end
    
    
if nargin==5  

    [s,t4] = FastTwoSum(c4,c5);
    [s,t3] = FastTwoSum(c3,s);
    [s,t2] = FastTwoSum(c2,s);
    [c1,t1] = FastTwoSum(c1,s);
    
    
    [s,t3] = FastTwoSum(t3,t4);
    [s,t2] = FastTwoSum(t2,s);
    [c2,t1] = FastTwoSum(t1,s);
    
    [s,t2] = FastTwoSum(t2,t3);
    [c3,t1] = FastTwoSum(t1,s);
    
    c4=t1+t2;
end

    
    
    
 
    