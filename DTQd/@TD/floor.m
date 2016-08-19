function c = floor(a)
% FLOOR   rounds the element of a to the nearest integers less than or
% equal to a in triple double format

% ���˸о�����������п�����ĳЩ�����������������ġ���������˫��������������⡣������������������������
% written by P. B. Du & H. Jiang NUDT 07/01/2013
c=a;                     %initial
c.p1= floor(a.p1);       % a is complex is also work here
c.p2=0;
c.p3=0;

if a.complex
    ar=real(a);ai=imag(a);
    cr=floor(ar);                    % ����������
    ci=floor(ai);
    c.p1=complex(cr.p1,ci.p1);
    c.p2=complex(cr.p2,ci.p2);
    c.p3=complex(cr.p3,ci.p3);
else
    if c.p1==a.p1
       c.p2=floor(a.p2);
        
       if c.p2==a.p2
          c.p3=floor(a.p3);
          
       end
    end
    [c.p1,c.p2,c.p3] = quick_renorm(c.p1,c.p2,c.p3);
end


