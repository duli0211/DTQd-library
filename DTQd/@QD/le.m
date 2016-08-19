function res = le(a,b)
%LE           Implements  a <= b  elementwise for quad-doubles a and b
% QD library qd_inline.h inline bool operator<=(const qd_real &a, const qd_real &b)
% written by P. B. Du & H. Jiang NUDT 07/01/2013
% we only consider real number not consider the complex number

    a=QD(a);                   % ��֪��������ֱ�Ӷ�����QDģʽ�� ���Ǿ���� QD DD double�ȽϺ�
    b=QD(b);                   % ���˸о�������Щ
    res= (a.p1 < b.p1 ||...
          (a.p1 == b.p1 && (a.p2 < b.p2 ||...
                            (a.p2 == b.p2 && (a.p3 < b.p3 ||...
                                              (a.p3 == b.p3 && a.p4 <= b.p4))))));
    
