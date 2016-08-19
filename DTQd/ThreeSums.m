function  [r0,r1,r2]  = ThreeSums( x,y,z )
% addition algorithm of three double floating point numbers 
%Algorithm for Quad-double precision floating point arithmetic.
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% input x,y,z three double number
% output: r0,r1,r2 


if nargout==1
    r0=x+y+z;
elseif nargout==2  || nargout==3  
    [u,v]=TwoSum(x,y);
    [r0,w]=TwoSum(u,z);
    if nargout==2                 %QD  qd_inline.h   inline void three_sum2
       r1=v+w;
       return
    end
    if nargout==3                 %QD  qd_inline.h   inline void three_sum                             
       [r1,r2]=TwoSum(v,w);
       return
    end
else
    error('the number of output has to be 2 or 3');
end


% three inputs can has the max number of outputs is 3. the number of ouputs
% can not be 4.