clear
clc

DTQdInit( 'toget', 'accurate' )


% a=DDrand(DD(1))
% aa=DDrand(DD(1))
% b=TDrand(TD(1))
% bb=TDrand(TD(1))
c=QDrand(QD(1))
cc=QDrand(QD(1))
% d=rand(1)
% dd=rand(1)
a=DD(c)
aa=DD(cc)
b=TD(c)
bb=TD(cc)
d=double(c)
dd=double(cc)

v16=vpa(d,16)
% v32=vpa(rand(1),32)
v32=vpa(a,32)
vv32=vpa(aa,32)
% v48=vpa(rand(1),48)
v48=vpa(b,48)
vv48=vpa(bb,48)
% v64=vpa(rand(1),64)
v64=vpa(c,64)
vv64=vpa(cc,64)


disp('---------------------------- + --------------------------------')

%------------- D+D -----------------
disp('------------- D+D -----------------')
tic
for j=1:1:1000
d+d;
end
toc

tic
for j=1:1:1000
v16+v16;
end
toc
%------------- D+DD -----------------
disp('------------- D+DD -----------------')
tic
for j=1:1:1000
a+d;
end
toc

tic
for j=1:1:1000
% vpa(v32+d,32);
v32+d;
end
toc
%------------- D+TD -----------------
disp('------------- D+TD -----------------')
tic
for j=1:1:1000
b+d;
end
toc

tic
for j=1:1:1000
% vpa(v48+d,48);
v48+d;
end
toc
%------------- D+QD -----------------
disp('------------- D+QD -----------------')
tic
for j=1:1:1000
c+d;
end
toc

tic
for j=1:1:1000
% vpa(v64+d,64);
v64+d;
end
toc
%------------- DD+DD -----------------
disp('------------- DD+DD -----------------')
tic
for j=1:1:1000
a+a;
end
toc

tic
for j=1:1:1000
% vpa(v32+v32,32);
v32+v32;
end
toc
%------------- DD+TD -----------------
disp('------------- DD+TD -----------------')
tic
for j=1:1:1000
a+b;
end
toc

tic
for j=1:1:1000
% vpa(v32+v48,48);
v32+v48;
end
toc
%------------- DD+QD -----------------
disp('------------- DD+QD -----------------')
tic
for j=1:1:1000
a+c;
end
toc

tic
for j=1:1:1000
% vpa(v32+v64,64);
v32+v64;
end
toc
%------------- TD+TD -----------------
disp('------------- TD+TD -----------------')
tic
for j=1:1:1000
b+b;
end
toc

tic
for j=1:1:1000
% vpa(v48+v48,48);
v48+v48;
end
toc
%------------- TD+QD -----------------
disp('------------- TD+QD -----------------')
tic
for j=1:1:1000
b+c;
end
toc

tic
for j=1:1:1000
% vpa(v48+v64,64);
v48+v64;
end
toc
%------------- QD+QD -----------------
disp('------------- QD+QD -----------------')
tic
for j=1:1:1000
c+c;
end
toc

tic
for j=1:1:1000
% vpa(v64+v64,64);
v64+v64;
end
toc


disp('---------------------------- * --------------------------------')

%------------- D*D -----------------
disp('------------- D*D -----------------')
tic
for j=1:1:1000
d*d;
end
toc

tic
for j=1:1:1000
v16*v16;
end
toc
%------------- D*DD -----------------
disp('------------- D*DD -----------------')
tic
for j=1:1:1000
a.*d;
end
toc

tic
for j=1:1:1000
% vpa(v32*d,32);
v32*d;
end
toc
%------------- D*TD -----------------
disp('------------- D*TD -----------------')
tic
for j=1:1:1000
b.*d;
end
toc

tic
for j=1:1:1000
% vpa(v48*d,48);
v48*d;
end
toc
%------------- D*QD -----------------
disp('------------- D*QD -----------------')
tic
for j=1:1:1000
c.*d;
end
toc

tic
for j=1:1:1000
% vpa(v64*d,64);
v64*d;
end
toc
%------------- DD*DD -----------------
disp('------------- DD*DD -----------------')
tic
for j=1:1:1000
a.*a;
end
toc

tic
for j=1:1:1000
% vpa(v32*v32,32);
v32*v32;
end
toc
%------------- DD*TD -----------------
disp('------------- DD*TD -----------------')
tic
for j=1:1:1000
a.*b;
end
toc

tic
for j=1:1:1000
% vpa(v32*v48,48);
v32*v48;
end
toc
%------------- DD*QD -----------------
disp('------------- DD*QD -----------------')
tic
for j=1:1:1000
a.*c;
end
toc

tic
for j=1:1:1000
% vpa(v32*v64,64);
v32*v64;
end
toc
%------------- TD*TD -----------------
disp('------------- TD*TD -----------------')
tic
for j=1:1:1000
b.*b;
end
toc

tic
for j=1:1:1000
% vpa(v48*v48,48);
v48*v48;
end
toc
%------------- TD*QD -----------------
disp('------------- TD*QD -----------------')
tic
for j=1:1:1000
b.*c;
end
toc

tic
for j=1:1:1000
% vpa(v48*v64,64);
v48*v64;
end
toc
%------------- QD*QD -----------------
disp('------------- QD*QD -----------------')
tic
for j=1:1:1000
c.*c;
end
toc

tic
for j=1:1:1000
% vpa(v64*v64,64);
v64*v64;
end
toc



disp('---------------------------- / --------------------------------')

%------------- D/D -----------------
disp('------------- D/D -----------------')
tic
for j=1:1:1000
d/dd;
end
toc
%------------- D/DD -----------------
disp('------------- D/DD -----------------')
tic
for j=1:1:1000
a./d;
end
toc

tic
for j=1:1:1000
% vpa(v32/d,32);
v32/d;
end
toc
%------------- D/TD -----------------
disp('------------- D/TD -----------------')
tic
for j=1:1:1000
b./d;
end
toc

tic
for j=1:1:1000
% vpa(v48/d,48);
v48/d;
end
toc
%------------- D/QD -----------------
disp('------------- D/QD -----------------')
tic
for j=1:1:1000
c./d;
end
toc

tic
for j=1:1:1000
% vpa(v64/d,64);
v64/d;
end
toc
%------------- DD/DD -----------------
disp('------------- DD/DD -----------------')
tic
for j=1:1:1000
a./aa;
end
toc

tic
for j=1:1:1000
% vpa(v32/v32,32);
v32/vv32;
end
toc
%------------- DD/TD -----------------
disp('------------- DD/TD -----------------')
tic
for j=1:1:1000
a./b;
end
toc

tic
for j=1:1:1000
% vpa(v32/v48,48);
v32/v48;
end
toc
%------------- DD/QD -----------------
disp('------------- DD/QD -----------------')
tic
for j=1:1:1000
a./c;
end
toc

tic
for j=1:1:1000
% vpa(v32/v64,64);
v32/v64;
end
toc
%------------- TD/TD -----------------
disp('------------- TD/TD -----------------')
tic
for j=1:1:1000
b./bb;
end
toc

tic
for j=1:1:1000
% vpa(v48/v48,48);
v48/vv48;
end
toc
%------------- TD/QD -----------------
disp('------------- TD/QD -----------------')
tic
for j=1:1:1000
b./c;
end
toc

tic
for j=1:1:1000
% vpa(v48/v64,64);
v48/v64;
end
toc
%------------- QD/QD -----------------
disp('------------- QD/QD -----------------')
tic
for j=1:1:1000
c./cc;
end
toc

tic
for j=1:1:1000
% vpa(v64/v64,64);
v64/vv64;
end
toc


disp('------------------------------------------------------------------')

%------------- exp(DD) -----------------
disp('------------- exp(DD) -----------------')
tic
for j=1:1:1000
exp(a);
end
toc

tic
for j=1:1:1000
exp(v32);
end
toc

%------------- exp(TD) -----------------
disp('------------- exp(TD) -----------------')
tic
for j=1:1:1000
exp(b);
end
toc

tic
for j=1:1:1000
exp(v48);
end
toc

%------------- exp(QD) -----------------
disp('------------- exp(QD) -----------------')
tic
for j=1:1:1000
exp(c);
end
toc

tic
for j=1:1:1000
exp(v64);
end
toc

%------------- ln(DD) -----------------
disp('------------- ln(DD) -----------------')
tic
for j=1:1:1000
log(a);
end
toc

tic
for j=1:1:1000
log(v32);
end
toc

%------------- ln(TD) -----------------
disp('------------- ln(TD) -----------------')
tic
for j=1:1:1000
log(b);
end
toc

tic
for j=1:1:1000
log(v48);
end
toc

%------------- ln(QD) -----------------
disp('------------- ln(QD) -----------------')
tic
for j=1:1:1000
log(c);
end
toc

tic
for j=1:1:1000
log(v64);
end
toc

%------------- sin(DD) -----------------
disp('------------- sin(DD) -----------------')
tic
for j=1:1:1000
sin(a);
end
toc

tic
for j=1:1:1000
sin(v32);
end
toc

%------------- sin(TD) -----------------
disp('------------- sin(TD) -----------------')
tic
for j=1:1:1000
sin(b);
end
toc

tic
for j=1:1:1000
sin(v48);
end
toc

%------------- sin(QD) -----------------
disp('------------- sin(QD) -----------------')
tic
for j=1:1:1000
sin(c);
end
toc

tic
for j=1:1:1000
sin(v64);
end
toc

%------------- tan(DD) -----------------
disp('------------- tan(DD) -----------------')
tic
for j=1:1:1000
tan(a);
end
toc

tic
for j=1:1:1000
tan(v32);
end
toc

%------------- tan(TD) -----------------
disp('------------- tan(TD) -----------------')
tic
for j=1:1:1000
tan(b);
end
toc

tic
for j=1:1:1000
tan(v48);
end
toc

%------------- tan(QD) -----------------
disp('------------- tan(QD) -----------------')
tic
for j=1:1:1000
tan(c);
end
toc

tic
for j=1:1:1000
tan(v64);
end
toc