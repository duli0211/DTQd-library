function c = round(a)
% round(X) rounds the elements of X to the nearest integers. 
% Positive elements with a fractional part of 0.5 round up to the nearest positive integer. 
% Negative elements with a fractional part of -0.5 round down to the nearest negative integer. 
% For complex X, the imaginary and real parts are rounded independently.
% QD library qd_real.cpp  qd_real nint(const qd_real &a) 
% written by P. B. Du & H. Jiang NUDT 07/01/2013

c=a;                     %initial
 % a is complex is also work here
c.p1= round(a.p1);
c.p2=0;
c.p3=0;
c.p4=0;
 
if a.complex
    ar=real(a);ai=imag(a);
    cr=round(ar);                    % 调用自身函数
    ci=round(ai);
    c.p1=complex(cr.p1,ci.p1);
    c.p2=complex(cr.p2,ci.p2);
    c.p3=complex(cr.p3,ci.p3);
    c.p4=complex(cr.p4,ci.p4);
else
     if c.p1==a.p1                   % First double is already an integer
         c.p2=round(a.p2); 
         if c.p2==a.p2               % Second double is already an integer.
             c.p3=round(a.p3);
             if c.p3==a.p3               % Second double is already an integer.
                 c.p4=round(a.p4);
             else
                 if abs(c.p3-a.p3)==0.5 && a.p4<0.0
                     c.p3=c.p3-1;
                 end
             end
         else
             if abs(c.p2-a.p2)==0.5 && a.p3<0.0
                 c.p2=c.p2-1;
             end
         end
     else
         if abs(c.p1-a.p1)==0.5 && a.p2<0.0
             c.p1=c.p1-1;
         end
     end
end

[c.p1,c.p2,c.p3,c.p4] = quick_renorm(c.p1,c.p2,c.p3,c.p4);
            
         
end
 

