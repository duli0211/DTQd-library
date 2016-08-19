function [c1,c2,c3,c4] = renorm(c1,c2,c3,c4,c5)
%  QD librcry qd_inline.h inline void renorm
% 
%  这个函数好像不能保证|c_i+1|<1/2.*upl|c_i|
%  按照QD 的paper中的函数应该是Renormalize.m函数。
% written by P. B. Du & H. Jiang NUDT 07/01/2013

if isinf(c1)
    disp('c1 is inf or -inf');
    c2=0;c3=0;c4=0;
   return
end

if nargin==3
    [s1,c3] = FastTwoSum(c2,c3);
    [c1,c2] = FastTwoSum(c1,s1);
    s1=c1;
    s2=c2;
    s3=0.0;
    if s2~=0
       [s2,s3] = FastTwoSum(s2,c3);
    else
       [s1,s2] = FastTwoSum(s1,c3);
    end
    c1=s1;
    c2=s2;
    c3=s3;
    if nargout>3
        error('the number of inputs is 3, that of outputs has to be smaller than or equal to 3');
    end
    
if nargin==4
    [s1,c4] = FastTwoSum(c3,c4);
    [s1,c3] = FastTwoSum(c2,s1);
    [c1,c2] = FastTwoSum(c1,s1);
    
    s1=c1;
    s2=c2;
    s3=0.0;
    s4=0.0;
    
    if s2~=0
       [s2,s3] = FastTwoSum(s2,c3);
       if s3~=0
          [s3,s4] = FastTwoSum(s3,c4);
       else
          [s2,s3] = FastTwoSum(s2,c4);
       end
    else
       [s1,s2] = FastTwoSum(s1,c3);
       if s2~=0
          [s2,s3] = FastTwoSum(s2,c4);
       else
          [s1,s2] = FastTwoSum(s1,c4);
       end
    end
    
    c1=s1;
    c2=s2;
    c3=s3;
    c4=s4;
elseif  nargin==5
    [s1,c5] = FastTwoSum(c4,c5);
    [s1,c4] = FastTwoSum(c3,s1);
    [s1,c3] = FastTwoSum(c2,s1);
    [c1,c2] = FastTwoSum(c1,s1);
    
 
    s3=0.0;
    s4=0.0;
    
    [s1,s2] = FastTwoSum(c1,c2);
    if s2~=0
       [s2,s3] = FastTwoSum(s2,c3);
       if s3~=0
          [s3,s4] = FastTwoSum(s3,c4);
          if s4~=0
              s4=s4+c5;
          else
              s3=s3+c5;
          end
       else
           [s2,s3] = FastTwoSum(s2,c4);
           if s3~=0  
              [s3,s4] = FastTwoSum(s3,c5);
           else
              [s2,s3] = FastTwoSum(s2,c5);
           end
       end
    else
       [s1,s2] = FastTwoSum(s1,c3);
       if s2~=0
          [s2,s3] = FastTwoSum(s2,c4);
           if s3~=0  
              [s3,s4] = FastTwoSum(s3,c5);
           else
              [s2,s3] = FastTwoSum(s2,c5);
           end
       else
           [s1,s2] = FastTwoSum(s1,c4);
           if s2~=0  
              [s2,s3] = FastTwoSum(s2,c5);
           else
              [s1,s2] = FastTwoSum(s1,c5);
           end
       end
    end
    c1=s1;
    c2=s2;
    c3=s3;
    c4=s4;
   
else
    disp('the number of inputs has be 4 or 5');
end
    
end

        
    
    
      


