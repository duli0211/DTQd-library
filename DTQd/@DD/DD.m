function c= DD(x,y)
%  DD      Doubel-double class constructor
%
%  c =DD(x)        type cast for x double or double-double
%  c = DD(s)        verified conversion for string s
%  written by H. Jiang NUDT 12/11/2012

% written by P. B. Du & H. Jiang NUDT 07/01/2013


if nargin==1
%     if isa(x,'logical')
%       x = double(x);
%     end

    if isa(x,'double')
      if isreal(x)
        c.complex = 0;    
      else
        c.complex = 1;
      end
      c.hi = x;
      c.lo = 0;
      c = class(c,'DD');
    elseif isa(x,'char')
        c.complex=0;              % now we only consider real number
        switch lower(x)           % predefined math constants
            case 'e'
                c.hi=2.718281828459045091e+00;
                c.lo=1.445646891729250158e-16;
            case 'log2'
                c.hi=6.931471805599452862e-01;
                c.lo=2.319046813846299558e-17;
            case 'log10'
                c.hi=2.302585092994045901e+00;
                c.lo=-2.170756223382249351e-16;
            case 'pi'
                c.hi=3.141592653589793116e+00;
                c.lo=1.224646799147353207e-16;
            case 'eps'
                c.hi=4.93038065763132e-32;    %2^-104
                c.lo=0.0;
            case 'realmax'
                c.hi=1.79769313486231570815e+308;
                c.lo=9.97920154767359795037e+291;
            case 'realmin'
                c.hi=2.0041683600089728e-292;                % no normalized
                c.lo=0.0;
            otherwise
                s0=str2double(x);  %for example c=DD('0.1')
                digits(40);        % for double-double 40bits is enough
                s1=double(vpa(x)-vpa(sym(s0,'f')));
                c=DD(s0,s1);
                return    
        end

        c = class(c,'DD');
      
    elseif isa(x,'DD')      % 1 parameter, double-double
       c = x;
       
    elseif isa(x,'TD')      % 1 parameter, triple-double
      c.complex=part_compl(x);
      c.hi=part1(x);
      c.lo=part2(x);
      
      c = class(c,'DD');      

    elseif isa(x,'QD')      % 1 parameter, quad-double
      c.complex=part_compl(x);
      c.hi=part1(x);
      c.lo=part2(x);
      
      c = class(c,'DD');
    else
       error('other data format');
    end
    
  elseif nargin==2
      if isa(x,'double') && isa(y,'double')
          c.complex=[];
          if isreal(x) && isreal(y)
             [c.hi,c.lo]=TwoSum(x,y);    % renormalize
          else
             [c.hi,c.lo]=TwoSumCplx(x,y);    % renormalize  for complex number
          end
          
          if ~isreal(c.hi) || ~isreal(c.lo)
              c.complex = 1;
          else
              c.complex=0;
          end
          
%           if c.hi==0 && c.lo~=0
%              c.hi=c.lo;
%              c.lo=0;   
%           end         
% 上面的TwoSum已经是renormalizing，  应该不会出现这这情况了
          
      else
          error('two inputs have to be in double format'); 
      end
       c = class(c,'DD');
  else
     err('the number of input has to be 1 or 2'); 
end
        
  

          

