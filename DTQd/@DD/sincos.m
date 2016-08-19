function [sin_a,cos_a]=sincos(a)
% written by P. B. Du & H. Jiang NUDT 07/01/2013


%  Table of sin(k * pi/16) and cos(k * pi/16)
sin_table(1)=DD(1.950903220161282758e-01, -7.991079068461731263e-18);
sin_table(2)=DD(3.826834323650897818e-01, -1.005077269646158761e-17);
sin_table(3)=DD(5.555702330196021776e-01,  4.709410940561676821e-17);
sin_table(4)=DD(7.071067811865475727e-01, -4.833646656726456726e-17);

cos_table(1)=DD(9.807852804032304306e-01, 1.854693999782500573e-17);
cos_table(2)=DD(9.238795325112867385e-01, 1.764504708433667706e-17);
cos_table(3)=DD(8.314696123025452357e-01, 1.407385698472802389e-18);
cos_table(4)=DD(7.071067811865475727e-01, -4.833646656726456726e-17);

dd_2pi = DD(6.283185307179586232e+00,2.449293598294706414e-16);
dd_pi2 = DD(1.570796326794896558e+00,6.123233995736766036e-17);
dd_pi16 = DD(1.963495408493620697e-01,7.654042494670957545e-18);

% if a.complex
%     error('we only consider real number now');
% end

if iszero(a)
      sin_a=DD(0);
      cos_a=DD(1);
      return
end

z=round(a./dd_2pi);
r=a-dd_2pi.*z;

q=floor(r.hi./dd_pi2.hi+0.5);
t=r-dd_pi2.*q;
j=round(q);
abs_j=abs(j);
q=floor(t.hi./dd_pi16.hi+0.5);
t=t-dd_pi16.*q;
k=round(q);
abs_k=abs(k);

if(abs_j>2)
    error('Cannot reduce modulo pi/2');
end

if(abs_k>4)
    error('Cannot reduce modulo pi/16');
end

[sin_t,cos_t]=sincos_taylor(t);

if(abs_k==0)
    s=sin_t;
    c=cos_t;
else
    u=cos_table(abs_k);
    v=sin_table(abs_k);
    if(k>0)
        s=u.*sin_t+v.*cos_t;
        c=u.*cos_t-v.*sin_t;
    else
        s=u.*sin_t-v.*cos_t;
        c=u.*cos_t+v.*sin_t;
    end
end

if(abs_j==0)
    sin_a=s;
    cos_a=c;
elseif(j==1)
    sin_a=c;
    cos_a=-s;
elseif(j==-1)
    sin_a=-c;
    cos_a=s;
else
    sin_a=-s;
    cos_a=-c;
end