function [ rh, rl ] = add_dd_d (ah, al, b)
% addition of  double-double  and double
% written  20/11/2012     P. B. Du & H. Jiang
[th,tl] = TwoSum(ah, b);
tl = al+tl;
[rh, rl] = FastTwoSum(th,tl);
end

