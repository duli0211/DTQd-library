function r = QDrand(a)
%RAND   generate random real number in quad-double format
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%  QD library qd_real.cpp  QD_API qd_real qdrand() \
% 这里和QD linrary中不同 我们应用matlab中的rand()函数
% 这个函数也是我自己写的。


if a==QD(1)
    m_const= 2^(-52);
    m=m_const;
   r=QD(rand());
   for i=2:1:4
       d=rand().*m;
       r=r+d;
       m=m_const^i;
   end
else
      error('more than two Dim other case will be  considered later');  
end

    

    
