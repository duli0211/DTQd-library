function c = ceil(a)
% Ceil   rounds the element of a to the nearest integers greater than or equal to a in quad-double format 
% QD library qd_real.cpp    qd_real ceil(const qd_real &a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013
c=a;                     %initial
c.p1= ceil(a.p1);
c.p2=0;
c.p3=0;
c.p4=0;


if a.complex
    ar=real(a);ai=imag(a);
    cr=ceil(ar);                    % 调用自身函数
    ci=ceil(ai);
    c.p1=complex(cr.p1,ci.p1);
    c.p2=complex(cr.p2,ci.p2);
    c.p3=complex(cr.p3,ci.p3);
    c.p4=complex(cr.p4,ci.p4);
else
   if c.p1==a.p1
       c.p2=ceil(a.p2);
        
       if c.p2==a.p2
          c.p3=ceil(a.p3);
          
          if c.p3==a.p3
             c.p4=ceil(a.p4);
          end
       end
    end
    [c.p1,c.p2,c.p3,c.p4] = quick_renorm(c.p1,c.p2,c.p3,c.p4);
end
