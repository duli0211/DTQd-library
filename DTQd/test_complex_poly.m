% written by P. B. Du & H. Jiang NUDT 06/01/2016
%效果不好，只有与double的混合运算才比sym快
clear
clc

n=100;
x=1.1;
%-------------------------- SYM -------------------------------------------
disp('------------------------- SYM -------------------------------------');

d=sym(zeros(1,n));
for i=1:1:n
%     d(i)=i+sym(0.01+0.1i,'f');
    d(i)=i+sym(0.01,'f');
end
tic
r=d(n);
for i=n-1:-1:1
    r=r.*x;
    r=r+d(i);
end
y_sym=r;
toc

disp('p(x) = ');
y_sym


clear

n=100;
x=vpa(1.1,64);
%-------------------------- VPA -------------------------------------------
disp('------------------------- VPA -------------------------------------');

% digits(64);

d=zeros(1,n);
for i=1:1:n
%     d(i)=i+sym(0.01+0.1i,'f');
    d(i)=i+vpa(0.01,64);
end
tic
r=d(n);
for i=n-1:-1:1
    r=r*x;
    r=r+d(i);
end
y_vpa=r;
toc

disp('p(x) = ');
vpa(y_vpa,64)


clear

DTQdInit( 'toget', 'sloppy' )
% DTQdInit( 'toget', 'accurate' )
n=100;
x=1.1;
% a=QD('0.01+0.1i');
a=QD('0.01');
%--------------------------- QD -------------------------------------------
disp('------------------------- QD -------------------------------------');

b=QD(zeros(1,n));
for i=1:1:n
    b(i)=i+a;
end
tic
r=b(n)
for i=n-1:-1:1
    r=r.*QD('1.1');
    r=r+b(i);
end
y_qd=r;
toc

disp('p(x) = ');
y_qd


clear

DTQdInit( 'toget', 'sloppy' )
% DTQdInit( 'toget', 'accurate' )
n=100;
x=1.1;
% a=QD('0.01+0.1i');
a=QD('0.01');
%--------------------------- QD TD-------------------------------------------
disp('------------------------- QD TD-------------------------------------');

b=QD(zeros(1,n));
for i=1:1:n
    b(i)=i+a;
end
tic
r=b(n)
for i=n-1:-1:1
    r=r.*TD('1.1');
    r=r+b(i);
end
y_qd=r;
toc

disp('p(x) = ');
y_qd


clear

DTQdInit( 'toget', 'sloppy' )
% DTQdInit( 'toget', 'accurate' )
n=100;
x=1.1;
% a=QD('0.01+0.1i');
a=QD('0.01');
%--------------------------- QD DD-------------------------------------------
disp('------------------------- QD DD-------------------------------------');

b=QD(zeros(1,n));
for i=1:1:n
    b(i)=i+a;
end
tic
r=b(n)
for i=n-1:-1:1
    r=r.*DD('1.1');
    r=r+b(i);
end
y_qd=r;
toc

disp('p(x) = ');
y_qd

clear

DTQdInit( 'toget', 'sloppy' )
% DTQdInit( 'toget', 'accurate' )
n=100;
x=1.1;
% a=QD('0.01+0.1i');
a=QD('0.01');
%--------------------------- QD D-------------------------------------------
disp('------------------------- QD D-------------------------------------');

c=QD(zeros(1,n));
for i=1:1:n
    c(i)=i+a;
end
tic
y_mixed=polyeval(c,x);
toc

disp('p(x) = ');
y_mixed

clear

DTQdInit( 'toget', 'sloppy' )
% DTQdInit( 'toget', 'accurate' )
n=100;
x=1.1;
% a=QD('0.01+0.1i');
a=TD('0.01');
%--------------------------- TD TD-------------------------------------------
disp('------------------------- TD TD-------------------------------------');

b=TD(zeros(1,n));
for i=1:1:n
    b(i)=i+a;
end
tic
r=b(n)
for i=n-1:-1:1
    r=r.*TD('1.1');
    r=r+b(i);
end
y_qd=r;
toc

disp('p(x) = ');
y_qd

clear

DTQdInit( 'toget', 'sloppy' )
% DTQdInit( 'toget', 'accurate' )
n=100;
x=1.1;
% a=QD('0.01+0.1i');
a=TD('0.01');
%--------------------------- TD DD-------------------------------------------
disp('------------------------- TD DD-------------------------------------');

b=TD(zeros(1,n));
for i=1:1:n
    b(i)=i+a;
end
tic
r=b(n)
for i=n-1:-1:1
    r=r.*DD('1.1');
    r=r+b(i);
end
y_qd=r;
toc

disp('p(x) = ');
y_qd

clear

DTQdInit( 'toget', 'sloppy' )
% DTQdInit( 'toget', 'accurate' )
n=100;
x=1.1;
% a=QD('0.01+0.1i');
a=TD('0.01');
%--------------------------- TD D-------------------------------------------
disp('------------------------- TD D-------------------------------------');

b=TD(zeros(1,n));
for i=1:1:n
    b(i)=i+a;
end
tic
r=b(n)
for i=n-1:-1:1
    r=r.*1.1;
    r=r+b(i);
end
y_qd=r;
toc

disp('p(x) = ');
y_qd

clear

DTQdInit( 'toget', 'sloppy' )
% DTQdInit( 'toget', 'accurate' )
n=100;
x=1.1;
% a=QD('0.01+0.1i');
a=DD('0.01');
%--------------------------- DD DD-------------------------------------------
disp('------------------------- DD DD-------------------------------------');

b=DD(zeros(1,n));
for i=1:1:n
    b(i)=i+a;
end
tic
r=b(n)
for i=n-1:-1:1
    r=r.*DD('1.1');
    r=r+b(i);
end
y_qd=r;
toc

disp('p(x) = ');
y_qd

clear

DTQdInit( 'toget', 'sloppy' )
% DTQdInit( 'toget', 'accurate' )
n=100;
x=1.1;
% a=QD('0.01+0.1i');
a=DD('0.01');
%--------------------------- DD D-------------------------------------------
disp('------------------------- DD D-------------------------------------');

b=DD(zeros(1,n));
for i=1:1:n
    b(i)=i+a;
end
tic
r=b(n)
for i=n-1:-1:1
    r=r.*1.1;
    r=r+b(i);
end
y_qd=r;
toc

disp('p(x) = ');
y_qd

clear

% DTQdInit( 'toget', 'sloppy' )
DTQdInit( 'toget', 'accurate' )
n=100;
x=1.1;
% a=QD('0.01+0.1i');
a=QD('0.01');
%--------------------------- QD -------------------------------------------
disp('------------------------- QD -------------------------------------');

b=QD(zeros(1,n));
for i=1:1:n
    b(i)=i+a;
end
tic
r=b(n);
for i=n-1:-1:1
    r=r.*QD('1.1');
    r=r+b(i);
end
y_qd=r;
toc

disp('p(x) = ');
y_qd


clear

% DTQdInit( 'toget', 'sloppy' )
DTQdInit( 'toget', 'accurate' )
n=100;
x=1.1;
% a=QD('0.01+0.1i');
a=QD('0.01');
%--------------------------- MIXED -------------------------------------------
disp('------------------------- MIXED -------------------------------------');

c=QD(zeros(1,n));
for i=1:1:n
    c(i)=i+a;
end
tic
y_mixed=polyeval(c,x);
toc

disp('p(x) = ');
y_mixed



