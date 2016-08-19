function c= TD(x,y,z)
%  TD      triple-double class constructor

% written by P. B. Du & H. Jiang NUDT 07/01/2013

if nargin==1
%  1 parameter, double     
   if isa(x,'double')    % inf and nan belongs to this case
      if isreal(x)
         c.complex = 0;
      else
         c.complex = 1;
      end
      c.p1 = x;
      c.p2 = 0.0;
      c.p3 = 0.0;
      c = class(c,'TD');
%  1 parameter, double-double         
   elseif isa(x,'DD')
      if isreal(x)
         c.complex = 0;
      else
         c.complex = 1;
      end
      c.p1 = hi(x);
      c.p2 = lo(x);
      c.p3 = 0.0;
      c = class(c,'TD');
% 1 parameter,  quad-double      
   elseif isa(x,'QD')      
      c.complex=part_compl(x);
      c.p1 = part1(x);
      c.p2 = part2(x);
      c.p3 = part3(x);
      c = class(c,'TD');
% 1 parameter,  char               
   elseif isa(x,'char')     
      c.complex=0;              % now we only consider real number
      switch lower(x)           % predefined math constants
          case 'e'
              c.p1=2.718281828459045091e+00;
              c.p2=1.445646891729250158e-16;
              c.p3=-2.127717108038176765e-33;
          case 'log2'
              c.p1=6.931471805599452862e-01;
              c.p2=2.319046813846299558e-17;
              c.p3=5.707708438416212066e-34;
          case 'log10'
              c.p1=2.302585092994045901e+00;
              c.p2=-2.170756223382249351e-16;
              c.p3=-9.984262454465776570e-33;
          case 'pi'
              c.p1=3.141592653589793116e+00;
              c.p2=1.224646799147353207e-16;
              c.p3=-2.994769809718339666e-33;
          case 'eps'
              c.p1=1.094764425253763e-47;               %= 2^-156
              c.p2=0;
              c.p3=0;
          case 'realmax'
              c.p1= 1.79769313486231570815e+308;              
              c.p2= 9.97920154767359795037e+291;
              c.p3= 5.53956966280111259858e+275;
          case 'realmin'
              c.p1=2.0041683600089728e-292;                % no normalized;   if normalized 1.6259745436952323e-260; //98 = 2^(-1022 + 3*53)    
              c.p2=0;
              c.p3=0; 
          otherwise
              s0=str2double(x);  % for example c=TD('0.1')
              digits(60);     % 60 bits is enough
              t1=vpa(x)-vpa(sym(s0,'f'));
              s1=double(t1);
              t2=t1-vpa(sym(s1,'f'));
              s2=double(t2);
              c=TD(s0,s1,s2);
              return
      end
      c = class(c,'TD');
% 1 parameter,  triple-double          
   elseif isa(x,'TD')      % 1 parameter, double-double
      c = x;
   else
      error('other data format');
   end
   
% the number of inputs are three, but these three numbers has to satisfy some conditions.   
elseif nargin==3    % example s=QD(1,eps/2,(eps/2)^2);
   if isa(x,'double') && isa(y,'double')&& isa(z,'double') 
      c.complex=[];
      if ~isreal(x) || ~isreal(y)||~isreal(z) 
          c.complex = 1;
          cr=real([x,y,z]);
          ci=imag([x,y,z]);
          
          [cr(1),cr(2),cr(3)]  = ThreeSums( cr(1),cr(2),cr(3) );    % maybe using this line of codes will insure using quick_renorm 
          [ci(1),ci(2),ci(3)]  = ThreeSums( ci(1),ci(2),ci(3));     % maybe using this line of codes will insure using quick_renorm 
          [cr(1),cr(2),cr(3)]=quick_renorm(cr(1),cr(2),cr(3));      % 
          [ci(1),ci(2),ci(3)]=quick_renorm(ci(1),ci(2),ci(3));
          CC=complex(cr,ci);
          c.p1=CC(1);
          c.p2=CC(2);
          c.p3=CC(3);     
       else
          c.complex=0;
          [x,y,z]  = ThreeSums( x,y,z );   % maybe using this line of codes will insure using quick_renorm 
          c.p1=x;
          c.p2=y;
          c.p3=z;
          [c.p1,c.p2,c.p3]=quick_renorm(c.p1,c.p2,c.p3);
      end
   else
      error('Four inputs have to be in double format'); 
   end
   c = class(c,'TD');
else
   err('the number of input has to be 1 or 3'); 
   return
end
          
          


