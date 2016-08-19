% Test 8. Sanity check for sin & cos
% written by P. B. Du & H. Jiang NUDT 07/01/2013


% Do simple sanity check
%    
%      sin(x) = sin(5x/7)cos(2x/7) + cos(5x/7)sin(2x/7)
%    
%      cos(x) = cos(5x/7)cos(2x/7) - sin(5x/7)sin(2x/7);

disp('-------------------------------------Test 8 is (Sanity check for sin/cos)-------------------------------------');

%---------------------------------- DD ------------------------------------
disp('------------------------- DD -------------------------------------');
x=DD('pi')./DD('3.0');
x1=5.*x./7;
x2=2.*x./7;

r1=sin(x1).*cos(x2)+cos(x1).*sin(x2);
r2=cos(x1).*cos(x2)-sin(x1).*sin(x2);
t1=sqrt(DD('3.0'))./DD('2.0');
t2=DD('0.5');

sin_dd=r1;
cos_dd=r2;
% delta_dd=max(abs(double(t1-r1)),abs(double(t2-r2)));
delta_dd=abs(double((sym(r1)-vpa('sqrt(3)/2',100))/vpa('sqrt(3)/2',100))); 

disp('sin(pi/3) = ');
sin_dd
disp('cos(pi/3) = ');
cos_dd
disp(['max_error = ', num2str(delta_dd)]);

%---------------------------------- TD ------------------------------------
disp('------------------------- TD -------------------------------------');
x=TD('pi')./TD('3.0');
x1=5.*x./7;
x2=2.*x./7;

r1=sin(x1).*cos(x2)+cos(x1).*sin(x2);
r2=cos(x1).*cos(x2)-sin(x1).*sin(x2);
t1=sqrt(TD('3.0'))./TD('2.0');
t2=TD('0.5');

sin_td=r1;
cos_td=r2;
% delta_td=max(abs(double(t1-r1)),abs(double(t2-r2)));
delta_td=abs(double((sym(r1)-vpa('sqrt(3)/2',100))/vpa('sqrt(3)/2',100))); 

disp('sin(pi/3) = ');
sin_td
disp('cos(pi/3) = ');
cos_td
disp(['max_error = ', num2str(delta_td)]);

%---------------------------------- QD ------------------------------------
disp('------------------------- QD -------------------------------------');
x=QD('pi')./QD('3.0');
x1=5.*x./7;
x2=2.*x./7;

r1=sin(x1).*cos(x2)+cos(x1).*sin(x2);
r2=cos(x1).*cos(x2)-sin(x1).*sin(x2);
t1=sqrt(QD('3.0'))./QD('2.0');
t2=QD('0.5');

sin_qd=r1;
cos_qd=r2;
% delta_qd=max(abs(double(t1-r1)),abs(double(t2-r2)));
delta_qd=abs(double((sym(r1)-vpa('sqrt(3)/2',100))/vpa('sqrt(3)/2',100))); 

disp('sin(pi/3) = ');
sin_qd
disp('cos(pi/3) = ');
cos_qd
disp(['max_error = ', num2str(delta_qd)]);