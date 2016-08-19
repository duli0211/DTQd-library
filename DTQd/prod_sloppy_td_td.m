function c= prod_sloppy_td_td(a,b)
%td *td
%input :a= [a0 a1 a2]; b=[ b0 b1 b2];
%output: c= [c0 c1 c2];
% /* triple-double * triple-double */
% /* a0 * b0                    0
%         a0 * b1               1
%         a1 * b0               2
%              a0 * b2          3
%              a1 * b1          4
%              a2 * b0          5
%                   a1 * b2     6
%                   a2 * b1     7 */
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% sloppy version

[p0,q0]=TwoProduct(a(1),b(1));
[p1,q1]=TwoProduct(a(1),b(2));
[p2,q2]=TwoProduct(a(2),b(1));

%  Start Accumulation
[p1,e0]=ThreeSums(p1,p2,q0);
 
% O(eps^2) order terms 

p2=e0+q1+q2+a(1).*b(3)+a(2).*b(2)+a(3).*b(1);

[c(1),c(2),c(3)] = quick_renorm(p0, p1, p2);


% 这样以来和acc版 最后一项的最后4，5位精度可能丢失。。。但是运算量减少很多。