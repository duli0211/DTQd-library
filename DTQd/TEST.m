% written by P. B. Du & H. Jiang NUDT 05/01/2016

clear;
clc;
DTQdInit( 'toget', 'accurate');
% DTQdInit( 'apart', 'accurate');
% DTQdInit( 'toget', 'sloppy');
% DTQdInit( 'apart', 'sloppy');

test1;
disp('Test 1 (Polynomial) is running successful');
disp(' ');
disp(' ');

test2;
disp('Test 2 (Machin`s Formula for Pi) is running successful');
disp(' ');
disp(' ');

test3;
disp('Test 3 (Salamin-Brent Quadratic Formula for Pi) is running successful');
disp(' ');
disp(' ');

test4;
disp('Test 4 (Borwein Quartic Formula for Pi) is running successful');
disp(' ');
disp(' ');

test5;
disp('Test 5 (Taylor Series Formula for e) is running successful');
disp(' ');
disp(' ');

test6;
disp('Test 6 (Taylor Series Formula for log 2) is running successful');
disp(' ');
disp(' ');

test7;
disp('Test 7 is (Sanity check for exp) running successful');
disp(' ');
disp(' ');

test8;
disp('Test 8 is (Sanity check for sin/cos) running successful');
disp(' ');
disp(' ');
