function c = floor(a)
% FLOOR   rounds the element of a to the nearest integers less than or equal to a in quad-double format 
% QD library qd_real.cpp  qd_real floor(const qd_real &a)

% 个人感觉这个函数很有可能在某些情况下是舍入有问题的。。类似于双倍舍入问题的问题。！！！！！！！！！！！！
% written by P. B. Du & H. Jiang NUDT 07/01/2013
c=a;                     %initial
c.p1= floor(a.p1);       % a is complex is also work here
c.p2=0;
c.p3=0;
c.p4=0;

if a.complex
    ar=real(a);ai=imag(a);
    cr=floor(ar);                    % 调用自身函数
    ci=floor(ai);
    c.p1=complex(cr.p1,ci.p1);
    c.p2=complex(cr.p2,ci.p2);
    c.p3=complex(cr.p3,ci.p3);
    c.p4=complex(cr.p4,ci.p4);
else
    if c.p1==a.p1
       c.p2=floor(a.p2);
        
       if c.p2==a.p2
          c.p3=floor(a.p3);
          
          if c.p3==a.p3
             c.p4=floor(a.p4);
          end
       end
    end
    [c.p1,c.p2,c.p3,c.p4] = quick_renorm(c.p1,c.p2,c.p3,c.p4);
end


