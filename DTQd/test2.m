%Test 2.  Machin's Formula for Pi
% written by P. B. Du & H. Jiang NUDT 07/01/2013

% Use the Machin's arctangent formula:
% 
%        pi / 4  =  4 arctan(1/5) - arctan(1/239)
% 
%      The arctangent is computed based on the Taylor series expansion
% 
%        arctan(x) = x - x^3 / 3 + x^5 / 5 - x^7 / 7 + ...

disp('-------------------------------------Test 2 (Machin`s Formula for Pi)-------------------------------------');
%---------------------------------- DD ------------------------------------
disp('------------------------- DD -------------------------------------');
% Compute arctan(1/5) 
d=DD('1.0');
t=d./DD('5');
r=sqr(t);
s1=0;
k=0;
sign=1;
while(t>DD('eps'))
    k=k+1;
    if(sign<0)
        s1=s1-t./d;
    else
        s1=s1+t./d;
    end
    d=d+2;
    t=t.*r;
    sign=-sign;
end

disp([num2str(k),' Iterations for compute arctan(1/5)']);

% Compute arctan(1/239)
d=DD('1.0');
t=d./DD('239');
r=sqr(t);
s2=0;
k=0;
sign=1;
while(t>DD('eps'))
    k=k+1;
    if(sign<0)
        s2=s2-t./d;
    else
        s2=s2+t./d;
    end
    d=d+2;
    t=t.*r;
    sign=-sign;
end

disp([num2str(k),' Iterations for compute arctan(1/239)']);

p=4.*s1-s2;
p_dd=p.*4;
% err_dd=abs(double(p_dd-DD('pi')));
err_dd=abs(double((sym(p_dd)-vpa('pi',100))/vpa('pi',100)));

disp('Pi = ');
p_dd
disp(['error = ', num2str(err_dd)]);

%---------------------------------- TD ------------------------------------
disp('------------------------- TD -------------------------------------');
% Compute arctan(1/5) 
d=TD('1.0');
t=d./TD('5');
r=sqr(t);
s1=0;
k=0;
sign=1;
while(t>TD('eps'))
    k=k+1;
    if(sign<0)
        s1=s1-t./d;
    else
        s1=s1+t./d;
    end
    d=d+2;
    t=t.*r;
    sign=-sign;
end
disp([num2str(k),' Iterations for compute arctan(1/5)']);

% Compute arctan(1/239)
d=TD('1.0');
t=d./TD('239');
r=sqr(t);
s2=0;
k=0;
sign=1;
while(t>TD('eps'))
    k=k+1;
    if(sign<0)
        s2=s2-t./d;
    else
        s2=s2+t./d;
    end
    d=d+2;
    t=t.*r;
    sign=-sign;
end
disp([num2str(k),' Iterations for compute arctan(1/239)']);

p=4.*s1-s2;
p_td=p.*4;
% err_td=abs(double(p_td-TD('pi')));
err_td=abs(double((sym(p_td)-vpa('pi',100))/vpa('pi',100)));
disp('Pi = ');
p_td
disp(['error = ', num2str(err_td)]);

%---------------------------------- QD ------------------------------------
disp('------------------------- QD -------------------------------------');
% Compute arctan(1/5) 
d=QD('1.0');
t=d./QD('5');
r=sqr(t);
s1=0;
k=0;
sign=1;
while(t>QD('eps'))
    k=k+1;
    if(sign<0)
        s1=s1-t./d;
    else
        s1=s1+t./d;
    end
    d=d+2;
    t=t.*r;
    sign=-sign;
end
disp([num2str(k),' Iterations for compute arctan(1/5)']);

% Compute arctan(1/239)
d=QD('1.0');
t=d./QD('239');
r=sqr(t);
s2=0;
k=0;
sign=1;
while(t>QD('eps'))
    k=k+1;
    if(sign<0)
        s2=s2-t./d;
    else
        s2=s2+t./d;
    end
    d=d+2;
    t=t.*r;
    sign=-sign;
end
disp([num2str(k),' Iterations for compute arctan(1/239)']);

p=4.*s1-s2;
p_qd=p.*4;
% err_qd=abs(double(p_qd-QD('pi')));
err_qd=abs(double((sym(p_qd)-vpa('pi',100))/vpa('pi',100)));
disp('Pi = ');
p_qd
disp(['error = ', num2str(err_qd)]);