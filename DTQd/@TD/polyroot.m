function res=polyroot(P,x0,max_iter,thresh)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

%P=TD([]) P=P(1)+P(2)*x+P(3)*x^2...P(n+1)*x^n
n=size(P,2);    %degree of n-1
if(n==1)
    disp('The degree of polynomial must lager than 1');
    res=TD(nan);
    return
end
max_c=abs(double(P(1)));
x=x0;
% d=zeros(1,n-1);
if(thresh==0)
    thresh=TD('eps');
end
    for i=2:1:n
        v=abs(double(P(i)));
        if(v>max_c)
            max_c=v;
        end
        d(i-1)=P(i).*(i-1);
    end
    thresh=thresh.*max_c;
    for i=1:1:max_iter
        f=polyeval(P,x);
        if(abs(f.p1)<thresh.p1)
%             disp('Convergence');
            res=x;
            return
        end
        x=x-(f./polyeval(d,x));
    end
    if(abs(f.p1)>=thresh.p1)
        disp('Failed to converge');
        res=TD(nan);
        return
    end    