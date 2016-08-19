function res = le(a,b)
%LE           Implements  a <= b  elementwise for triple-doubles a and b
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% we only consider real number not consider the complex number

    if isa(a,'QD') || isa(b,'QD')
        res=QD(a)<=QD(b);
    elseif isa(a,'TD') || isa(b,'TD')
        a=TD(a);                   % 不知道这里是直接都化成QD模式好 还是具体分 QD DD double比较好
        b=TD(b);                   % 个人感觉这样简单些
        res= (a.p1 < b.p1 ||...
              (a.p1 == b.p1 && (a.p2 < b.p2 ||...
                                (a.p2 == b.p2 && (a.p3 <= b.p3)))));
    else
        error('a or b is neithor in TD or QD format');
    end

