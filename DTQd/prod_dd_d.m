function [rh, rl] = prod_dd_d(ah,al,b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013

[th,tl] = TwoProduct(ah,b);
tl = al*b+tl;  
[rh, rl] = FastTwoSum(th, tl);
end

