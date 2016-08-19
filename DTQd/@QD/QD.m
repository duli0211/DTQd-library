function c= QD(x,y,z,t)
%  QD      quad-double class constructor
%
%  c = QD(x)        type cast for x double or double-double or Quad-double
%  c = QD(s)        verified conversion for string s
%
% written by P. B. Du & H. Jiang NUDT 07/01/2013


  if nargin==1
     if isa(x,'double')    % inf and nan belongs to this case
        if isreal(x)
          c.complex = 0;
        else
          c.complex = 1;
        end
        c.p1 = x;
        c.p2 = 0;
        c.p3 = 0;
        c.p4 = 0;
        c = class(c,'QD');
     elseif isa(x,'DD')
        if isreal(x)
          c.complex = 0;
        else
          c.complex = 1;
        end
        c.p1 = hi(x);
        c.p2 = lo(x);
        c.p3 = 0;
        c.p4 = 0;
        c = class(c,'QD');
        
     elseif isa(x,'TD')
        if isreal(x)
          c.complex = 0;
        else
          c.complex = 1;
        end
        c.p1 = part1(x);
        c.p2 = part2(x);
        c.p3 = part3(x);
        c.p4 = 0;
        c = class(c,'QD');      
               
    elseif isa(x,'char')   
        c.complex=0;              % now we only consider real number
        switch lower(x)           % predefined math constants
            case 'e'
                c.p1=2.718281828459045091e+00;
                c.p2=1.445646891729250158e-16;
                c.p3=-2.127717108038176765e-33;
                c.p4=1.515630159841218954e-49;
            case 'log2'
                c.p1=6.931471805599452862e-01;
                c.p2=2.319046813846299558e-17;
                c.p3=5.707708438416212066e-34;
                c.p4=-3.582432210601811423e-50;
            case 'log10'
                c.p1=2.302585092994045901e+00;
                c.p2=-2.170756223382249351e-16;
                c.p3=-9.984262454465776570e-33;
                c.p4=-4.023357454450206379e-49;
            case 'pi'
                c.p1=3.141592653589793116e+00;
                c.p2=1.224646799147353207e-16;
                c.p3=-2.994769809718339666e-33;
                c.p4=1.112454220863365282e-49;
            case 'eps'
                c.p1=1.21543267145725e-63;               %= 2^-209
                c.p2=0;
                c.p3=0;
                c.p4=0;
            case 'realmax'
                c.p1= 1.79769313486231570815e+308;              
                c.p2= 9.97920154767359795037e+291;
                c.p3= 5.53956966280111259858e+275;
                c.p4= 3.07507889307840487279e+259;
            case 'realmin'
                c.p1=2.0041683600089728e-292;                % no normalized;   if normalized 1.6259745436952323e-260; //98 = 2^(-1022 + 3*53)    
                c.p2=0;
                c.p3=0;
                c.p4=0; 
            otherwise
                s0=str2double(x);  %for example c=QD('0.1')
                digits(80);     % 80 bits is enough
                t1=vpa(x)-vpa(sym(s0,'f'));
                s1=double(t1);
                t2=t1-vpa(sym(s1,'f'));
                s2=double(t2);
                t3=t2-vpa(sym(s2,'f'));
                s3=double(t3);
                c=QD(s0,s1,s2,s3);
                return    
        end

        c = class(c,'QD');
      
    elseif isa(x,'QD')      % 1 parameter, double-double
       c = x;

    else
       error('other data format');
    end
    
  elseif nargin==4    % example s=QD(1,eps/2,(eps/2)^2,(eps/2)^4);
      if isa(x,'double') && isa(y,'double')&& isa(z,'double') && isa(t,'double')
         c.complex=[];
         if ~isreal(x) || ~isreal(y)||~isreal(z) || ~isreal(t)
            c.complex = 1;
            %error('We did not consider four complex  inputs now, since we have not consider renormlize for complex number');
   
            cr=real([x,y,z,t]);
            ci=imag([x,y,z,t]);
            [cr(1),cr(2),cr(3),cr(4)]=quick_renorm(cr(1),cr(2),cr(3),cr(4));   % renorm used FastTwoSum then it requires  the abs(x)>=abs(y)>=abs(z)>=abs(t)
            [ci(1),ci(2),ci(3),ci(4)]=quick_renorm(ci(1),ci(2),ci(3),ci(4));
            CC=complex(cr,ci);
            c.p1=CC(1);
            c.p2=CC(2);
            c.p3=CC(3);
            c.p4=CC(4);
            
         else
             c.complex=0;
             
             c.p1=x;
             c.p2=y;
             c.p3=z;
             c.p4=t;
             
             [c.p1,c.p2,c.p3,c.p4]=quick_renorm(c.p1,c.p2,c.p3,c.p4);

         end
      else
          error('Four inputs have to be in double format'); 
      end
      c = class(c,'QD');
  else
     err('the number of input has to be 1 or 4'); 
     return
  end
          
          

