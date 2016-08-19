% Test 5.  Taylor Series Formula for e
% written by P. B. Du & H. Jiang NUDT 07/01/2013

% Use Taylor series
% 
%        e = 1 + 1 + 1/2! + 1/3! + 1/4! + ...
% 
%      To compute e.

disp('-------------------------------------Test 5 (Taylor Series Formula for e)-------------------------------------');

%---------------------------------- DD ------------------------------------
disp('------------------------- DD -------------------------------------');
s=DD('2.0');
t=DD('1.0');
n=DD('1.0');
i=0;

while(t>DD('eps'))
    i=i+1;
    n=n+1.0;
    t=t./n;
    s=s+t;
end
e_dd=s;
delta_dd=abs(double((sym(s)-vpa('exp(1)',100))/vpa('exp(1)',100)));

disp([num2str(i),' Iterations']);
disp('e = ');
e_dd
disp(['error = ', num2str(delta_dd)]);

%---------------------------------- TD ------------------------------------
disp('------------------------- TD -------------------------------------');
s=TD('2.0');
t=TD('1.0');
n=TD('1.0');
i=0;

while(t>TD('eps'))
    i=i+1;
    n=n+1.0;
    t=t./n;
    s=s+t;
end
e_td=s;
delta_td=abs(double((sym(s)-vpa('exp(1)',100))/vpa('exp(1)',100)));

disp([num2str(i),' Iterations']);
disp('e = ');
e_td
disp(['error = ', num2str(delta_td)]);

%---------------------------------- QD ------------------------------------
disp('------------------------- QD -------------------------------------');
s=QD('2.0');
t=QD('1.0');
n=QD('1.0');
i=0;

while(t>QD('eps'))
    i=i+1;
    n=n+1.0;
    t=t./n;
    s=s+t;
end
e_qd=s;
delta_qd=abs(double((sym(s)-vpa('exp(1)',100))/vpa('exp(1)',100)));

disp([num2str(i),' Iterations']);
disp('e = ');
e_qd
disp(['error = ', num2str(delta_qd)]);