create TABLE Book (
    bookid NUMBER(2) PRIMARY KEY,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(20)
);

-- ���Ե������� Imported_Book ���̺�
create TABLE Imported_Book (
    bookid NUMBER(2) PRIMARY KEY,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(20)
);

-- ������ customer ���̺�
create TABLE Customer (
    custid NUMBER(2) PRIMARY KEY,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(20)
);

-- �ֹ����� Orders ���̺�
create TABLE Orders (
    orderid NUMBER(2) PRIMARY KEY,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);

--Book ���̺� 10���� ���� ������ �߰��ϼ���
insert into Book VALUES(1, '�౸�� ����', '�½�����', 7000);
insert into Book VALUES(2, '�տ��� �̾߱�', '����Ŭ����', 13000);
insert into Book VALUES(3, '�ٳ�������', '��ũ��', 22000);
insert into Book VALUES(4, '�Ƿηο� ģ����', '���ѹ̵��', 35000);
insert into Book VALUES(5, '�Ͽ��� �����̴� ��', '�½�����', 8000);
insert into Book VALUES(6, '�ظ�����', '�½�����', 6000);
insert into Book VALUES(7, '����', '�̻�̵��', 20000);
insert into Book VALUES(8, '���ǿ�', '�̻�̵��', 13000);
insert into Book VALUES(9, '���������Ƿ�', '�����', 7500);
insert into Book VALUES(10, 'Olmpic Champions', 'Pearson', 13000);

insert into Customer VALUES(1, '������', '���� ��ü����', '000-1234-5678');
insert into Customer VALUES(2, '�����', '���� ����', '000-2234-5678');
insert into Customer VALUES(3, '�迬��', '���ѹα� ����', '000-3234-5678');
insert into Customer VALUES(4, '�߽ż�', '�̱� Ŭ������', '000-4234-5678');
insert into Customer VALUES(5, '�ڼ���', '���ѹα� ����', 'NULL');

insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));