function  [r1,r2,r3,r4]  = FourSums(a1,a2,a3,a4)
% addition algorithm of four double floating point numbers 
%
% input a1,a2,a3,a4 double number
% output: r1,r2,r3,r4  satisfying abs(r1)>abs(r2)>abs(r3)>abs(r4) and the
% overlap is not only serval bits
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013


if nargout==1
    r1=a1+a2+a3+a4;
elseif nargout==2 || nargout==3  || nargout==4 
    [s,t1]=TwoSum(a1,a2);
    [s,t2]=TwoSum(s,a3);
    [r1,t3]=TwoSum(s,a4);    
    if nargout==2                 
       r2=t1+t2+t3;
       return
    end
    if nargout==3  || nargout==4                            
       [s,e1]=TwoSum(t1,t2);
       [r2,e2]=TwoSum(s,t3);
       if nargout==3
           r3=e1+e2;
       end
       if nargout==4
           [r3,r4]=TwoSum(e1,e2);
       end
    end
else
    error('the number of output has to be 2 or 3');
end


% three inputs can has the max number of outputs is 3. the number of ouputs
% can not be 4.