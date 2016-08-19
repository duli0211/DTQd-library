function c = npwr(a,n)
%  Computes the n-th power of a quade-double number (real)
%  QD Library qd_real.cpp  qd_real pow(const qd_real &a, int n)
% written by P. B. Du & H. Jiang NUDT 07/01/2013
%
if n==0
    if a==QD(0)
        disp('0^0 is wrong');
        c=QD(nan);
        return;
    else
        c=QD(1);
        return
    end
end

r=a;
s=QD(1.0);
N=int32(abs(n));

if N>1  % Use binary exponentiation
    while N>0
        if mod(N,2)==1
            s=s.*r;
        end
        N=int32(floor(double(N)/2));
        
        
        if N>0
            r=sqr(r);
        end
        if N==0
            break
        end
        
    end
else
    s=r;
end

%  Compute the reciprocal if n is negative.

if n<0
    c=1.0 ./ s;
else
    c=s;
end



       
    






