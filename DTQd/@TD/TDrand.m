function r = TDrand(a)
%RAND   generate random real number in triple-double format


% �����QD linrary�в�ͬ ����Ӧ��matlab�е�rand()����
% �������Ҳ�����Լ�д�ġ�
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