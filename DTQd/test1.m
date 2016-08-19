%Test 1.  Polynomial Evaluation / Polynomial Solving
% written by P. B. Du & H. Jiang NUDT 07/01/2013

disp('---------------------------------------Test 1 (Polynomial)-------------------------------------------');
n=8;
%--------------------------- DD -------------------------------------------
a=DD(zeros(1,n));
for i=1:1:n
    a(i)=i+DD('0.01');
end
x_dd=polyroot(a,DD(0),1000,0);
y_dd=polyeval(a,x_dd);

disp('------------------------- DD -------------------------------------');
disp('Root found : x = ');
x_dd
disp('p(x) = ');
y_dd

%--------------------------- TD -------------------------------------------
b=TD(zeros(1,n));
for i=1:1:n
    b(i)=i+TD('0.01');
end
x_td=polyroot(b,TD(0),1000,0);
y_td=polyeval(b,x_td);

disp('------------------------- TD -------------------------------------');
disp('Root found : x = ');
x_td
disp('p(x) = ');
y_td

%--------------------------- QD -------------------------------------------
c=QD(zeros(1,n));
for i=1:1:n
    c(i)=i+QD('0.01');
end
x_qd=polyroot(c,QD(0),1000,0);
y_qd=polyeval(c,x_qd);

disp('------------------------- QD -------------------------------------');
disp('Root found : x = ');
x_qd
disp('p(x) = ');
y_qd