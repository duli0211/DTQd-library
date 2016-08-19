% Test 6.  Taylor Series Formula for log 2
% written by P. B. Du & H. Jiang NUDT 07/01/2013

% Use the Taylor series
% 
%       -log(1-x) = x + x^2/2 + x^3/3 + x^4/4 + ...
% 
%      with x = 1/2 to get  log(1/2) = -log 2

disp('-------------------------------------Test 6 (Taylor Series Formula for log 2)-------------------------------------');

%---------------------------------- DD ------------------------------------
disp('------------------------- DD -------------------------------------');
s=DD('0.5');
t=DD('0.5');
n=DD('1.0');
i=0;

while(abs(t)>DD('eps'))
    i=i+1;
    n=n+1;
    t=t.*0.5;
    s=s+t./n;
end
log2_dd=s;
delta_dd=abs(double((sym(s)-vpa('log(2)',100))/vpa('log(2)',100)));

disp([num2str(i),' Iterations']);
disp('log2 = ');
log2_dd
disp(['error = ', num2str(delta_dd)]);

%---------------------------------- TD ------------------------------------
disp('------------------------- TD -------------------------------------');
s=TD('0.5');
t=TD('0.5');
n=TD('1.0');
i=0;

while(abs(t)>TD('eps'))
    i=i+1;
    n=n+1;
    t=t.*0.5;
    s=s+t./n;
end
log2_td=s;
delta_td=abs(double((sym(s)-vpa('log(2)',100))/vpa('log(2)',100)));

disp([num2str(i),' Iterations']);
disp('log2 = ');
log2_td
disp(['error = ', num2str(delta_td)]);

%---------------------------------- QD ------------------------------------
disp('------------------------- QD -------------------------------------');
s=QD('0.5');
t=QD('0.5');
n=QD('1.0');
i=0;

while(abs(t)>QD('eps'))
    i=i+1;
    n=n+1;
    t=t.*0.5;
    s=s+t./n;
end
log2_qd=s;
delta_qd=abs(double((sym(s)-vpa('log(2)',100))/vpa('log(2)',100)));

disp([num2str(i),' Iterations']);
disp('log2 = ');
log2_qd
disp(['error = ', num2str(delta_qd)]);