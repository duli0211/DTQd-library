% Test 3.  Salamin-Brent Quadratic Formula for Pi
% written by P. B. Du & H. Jiang NUDT 07/01/2013

disp('-------------------------------------Test 3 (Salamin-Brent Quadratic Formula for Pi)-------------------------------------');

max_iter=20;

%---------------------------------- DD ------------------------------------
disp('------------------------- DD -------------------------------------');
a=DD('1.0');
b=sqrt(DD('0.5'));
s=DD('0.5');
m=DD('1.0');
p=2.0.*sqr(a)./s;
if(abs(double(p-DD('pi')))<64*double(DD('eps')))
        p_dd=p;
        return
end
    
for i=1:1:max_iter
    m=m.*2.0;
    a_new=0.5.*(a+b);
    b_new=a.*b;
    s=s-m.*(sqr(a_new)-b_new);
    a=a_new;
    b=sqrt(b_new);
    p_old=p;
    p=2.0.*sqr(a)./s;
    if(abs(double(p-p_old))<64*double(DD('eps')))
        disp([num2str(i),' Iteration :']);        
        p_dd=p
        break
    end
end
err_dd=abs(double(p-DD('pi')));
disp(['error = ', num2str(err_dd)]);

%---------------------------------- TD ------------------------------------
disp('------------------------- TD -------------------------------------');
a=TD('1.0');
b=sqrt(TD('0.5'));
s=TD('0.5');
m=TD('1.0');
p=2.0.*sqr(a)./s;
if(abs(double(p-TD('pi')))<64*double(TD('eps')))
        p_dd=p;
        return
end

for i=1:1:max_iter
    m=m.*2.0;
    a_new=0.5.*(a+b);
    b_new=a.*b;
    s=s-m.*(sqr(a_new)-b_new);
    a=a_new;
    b=sqrt(b_new);
    p_old=p;
    p=2.0.*sqr(a)./s;
    if(abs(double(p-p_old))<64*double(TD('eps')))
        disp([num2str(i),' Iteration :']);
        p_td=p
        break
    end
end
err_td=abs(double(p-TD('pi')));
disp(['error = ', num2str(err_td)]);

%---------------------------------- QD ------------------------------------
disp('------------------------- QD -------------------------------------');
a=QD('1.0');
b=sqrt(QD('0.5'));
s=QD('0.5');
m=QD('1.0');
p=2.0.*sqr(a)./s;
if(abs(double(p-QD('pi')))<64*double(QD('eps')))
        p_dd=p;
        return
end

for i=1:1:max_iter
    m=m.*2.0;
    a_new=0.5.*(a+b);
    b_new=a.*b;
    s=s-m.*(sqr(a_new)-b_new);
    a=a_new;
    b=sqrt(b_new);
    p_old=p;
    p=2.0.*sqr(a)./s;
    if(abs(double(p-p_old))<64*double(QD('eps')))
        disp([num2str(i),' Iteration :']);
        p_qd=p
        break
    end
end
err_qd=abs(double(p-QD('pi')));
disp(['error = ', num2str(err_qd)]);