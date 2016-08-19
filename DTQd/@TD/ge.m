function res = ge(a,b)
%GE           Implements  a >= b  elementwise for quad-doubles a and b
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% we only consider real number not consider the complex number

    if isa(a,'QD') || isa(b,'QD')
        res=QD(a)>=QD(b);
    elseif isa(a,'TD') || isa(b,'TD')
        a=TD(a);                   % ��֪��������ֱ�Ӷ�����QDģʽ�� ���Ǿ���� QD DD double�ȽϺ�
        b=TD(b);                   % ���˸о�������Щ
        res= (a.p1 > b.p1 ||...
              (a.p1 == b.p1 && (a.p2 > b.p2 ||...
                                (a.p2 == b.p2 && (a.p3 >= b.p3)))));
    else
        error('a or b is neithor in TD or QD format');
    end

