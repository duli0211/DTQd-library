%  Test 7.  Sanity check for exp
% written by P. B. Du & H. Jiang NUDT 07/01/2013

% Do simple sanity check
%    
%       e^2 = exp(2)
%           = exp(-13/4) * exp(-9/4) * exp(-5/4) * exp(-1/4) *
%             exp(3/4) * exp(7/4) * exp(11/4) * exp(15/4)

disp('-------------------------------------Test 7 is (Sanity check for exp)-------------------------------------');

%---------------------------------- DD ------------------------------------
disp('------------------------- DD -------------------------------------');
 t=DD('-3.25');
 tt=-3.25;
 p=DD('1.0');
 pp=1;
 for i=0:1:7
     p=p.*exp(t)
     pp=pp*vpa(exp(tt),32)
     t=t+1;
     tt=tt+1;
 end
 
 disp('exp(2) = ');
 t1=exp(DD('2.0'))
 disp('e^2 = ');
 t2=sqr(DD('e'))
 
 exp2_dd=p;
%  delta_dd=max(abs(double(t1-p)),abs(double(t2-p)));
delta_dd=abs(double((sym(p)-vpa('exp(2)',100))/vpa('exp(2)',100))); 

 disp('result = ');
 exp2_dd
 disp(['error = ', num2str(delta_dd)]);
 
 %---------------------------------- TD ------------------------------------
 disp('------------------------- TD -------------------------------------');
 t=TD('-3.25');
 p=TD('1.0');
 
 for i=0:1:7
     p=p.*exp(t);
     t=t+1;
 end
 
 disp('exp(2) = ');
 t1=exp(TD('2.0'))
 disp('e^2 = ');
 t2=sqr(TD('e'))
 
 exp2_td=p;
%  delta_td=max(abs(double(t1-p)),abs(double(t2-p)));
 delta_td=abs(double((sym(p)-vpa('exp(2)',100))/vpa('exp(2)',100))); 

 disp('result = ');
 exp2_td
 disp(['error = ', num2str(delta_td)]);
 
 %---------------------------------- QD ------------------------------------
 disp('------------------------- QD -------------------------------------');
 t=QD('-3.25');
 p=QD('1.0');
 
 for i=0:1:7
     p=p.*exp(t);
     t=t+1;
 end
 
 disp('exp(2) = ');
 t1=exp(QD('2.0'))
 disp('e^2 = ');
 t2=sqr(QD('e'))
 
 exp2_qd=p;
%  delta_qd=max(abs(double(t1-p)),abs(double(t2-p)));
 delta_qd=abs(double((sym(p)-vpa('exp(2)',100))/vpa('exp(2)',100))); 

 disp('result = ');
 exp2_qd
 disp(['error = ', num2str(delta_qd)]);