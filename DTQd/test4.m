% Test 4.   Borwein Quartic Formula for Pi
% written by P. B. Du & H. Jiang NUDT 07/01/2013

disp('-------------------------------------Test 4 (Borwein Quartic Formula for Pi)-------------------------------------');

max_iter=20;

%---------------------------------- DD ------------------------------------
a=DD('6.0')-DD('4.0').*sqrt(DD('2.0'));
y=sqrt(DD('2.0'))-1.0;
m=DD('2.0');
p=inv(a);
if(abs(double(p-DD('pi')))<16*double(DD('eps')))
        p_dd=p;
        return
end

for i=1:1:max_iter
    m=m.*4;
    r=nroot(1-sqr(sqr(y)),int8(4));
    y=(1-r)./(1+r);
    a=a.*sqr(sqr(1+y))-m.*y.*(1+y+sqr(y));
    p_old=p;
    p=inv(a);
    if(abs(double(p-p_old))<16*double(DD('eps')))
        disp([num2str(i),' Iteration :']);
        p_dd=p
        break
    end
end
err_dd=abs(double(p-DD('pi')));
disp(['error = ', num2str(err_dd)]);

%---------------------------------- TD ------------------------------------
a=TD('6.0')-TD('4.0').*sqrt(TD('2.0'));
y=sqrt(TD('2.0'))-1.0;
m=TD('2.0');
p=inv(a);
if(abs(double(p-TD('pi')))<16*double(TD('eps')))
        p_td=p;
        return
end

for i=1:1:max_iter
    m=m.*4;
    r=nroot(1-sqr(sqr(y)),int8(4));
    y=(1-r)./(1+r);
    a=a.*sqr(sqr(1+y))-m.*y.*(1+y+sqr(y));
    p_old=p;
    p=inv(a);
    if(abs(double(p-p_old))<16*double(TD('eps')))
        disp([num2str(i),' Iteration :']);
        p_td=p
        break
    end
end
err_td=abs(double(p-TD('pi')));
disp(['error = ', num2str(err_td)]);

%---------------------------------- QD ------------------------------------
a=QD('6.0')-QD('4.0').*sqrt(QD('2.0'));
y=sqrt(QD('2.0'))-1.0;
m=QD('2.0');
p=inv(a);
if(abs(double(p-QD('pi')))<16*double(QD('eps')))
        p_qd=p;
        return
end

for i=1:1:max_iter
    m=m.*4;
    r=nroot(1-sqr(sqr(y)),int8(4));
    y=(1-r)./(1+r);
    a=a.*sqr(sqr(1+y))-m.*y.*(1+y+sqr(y));
    p_old=p;
    p=inv(a);
    if(abs(double(p-p_old))<16*double(QD('eps')))
        disp([num2str(i),' Iteration :']);
        p_qd=p
        break
    end
end
err_qd=abs(double(p-QD('pi')));
disp(['error = ', num2str(err_qd)]);