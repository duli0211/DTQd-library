function r = TDrand(a)
%RAND   generate random real number in triple-double format


% 这里和QD linrary中不同 我们应用matlab中的rand()函数
% 这个函数也是我自己写的。
% written by P. B. Du & H. Jiang NUDT 07/01/2013


if a==TD(1)
    m_const= 2^(-52);
    m=m_const;
   r=TD(rand());
   for i=2:1:3
       d=rand().*m;
       r=r+d;
       m=m_const^i;
   end
else
      error('more than two Dim other case will be  considered later');  
end