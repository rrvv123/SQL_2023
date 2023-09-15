--DDL(Data Defination Language): ������ ���Ǿ�

--������(newcustomer table)
--custid, name, address, phone
CREATE TABLE NEWCUSTOMER(
    CUSTID NUMBER PRIMARY KEY, 
	NAME VARCHAR2(40),
	ADDRESS VARCHAR2(40),
	PHONE VARCHAR2(30)
);

--�ֹ�����(neworders table)
--orderid(�⺻Ű)
--custid(not null, newcustomer custid �����ؼ� �ܷ�Ű ����, �������), 
--bookid(not null, newbook1 bookid �����ؼ� �ܷ�Ű, �������), 
--saleprice
--orderdate(date��)
CREATE TABLE NEWORDERS(	
    ORDERID NUMBER primary key,
	CUSTID NUMBER NOT NULL, 
	BOOKID NUMBER NOT NULL,
	SALEPRICE NUMBER,
	ORDERDATE DATE,
    FOREIGN KEY(CUSTID) REFERENCES NEWCUSTOMER(CUSTID) ON DELETE CASCADE,
    FOREIGN KEY(BOOKID) REFERENCES NEWBOOK3 (BOOKID) ON DELETE CASCADE
);

-- Alter��
-- �̹� ������ ���̺��� ������ ������ �� ���
-- add(�߰�), drop(����), modify(����)

-- ������ newbook1 ���̺��� �����ϰ� �� ���̺� �ۼ�
create table newbook1(
bookid number,
bookname VARCHAR2(20),
publisher VARCHAR2(20),
price number
);

-- isbn �÷��߰�
alter table newbook1
add isbn varchar2(13);
-- isbn �÷��� �ڷ��� ����
alter table newbook1
MODIFY isbn number;

-- isbn �÷� ����
alter table newbook1 drop column isbn;

-- bookname �÷��� varchar2(30) not null �������� ����
alter table newbook1
MODIFY bookname varchar2(30) not null;

-- bookid �÷��� �⺻Ű �߰�
alter table newbook1
MODIFY bookid number not null;
-- bookid �÷��� �⺻Ű �߰�
alter table newbook1
add primary key(bookid);

-- ���̺� ����
drop table newbook1;

-- DML(select, insert(�����ͻ���), update(�����ͼ���), delete(�����ͻ���))
-- insert 1�� ���: �Ӽ� (�÷�)����Ʈ ����
insert into book
values(11, '���� ����', '��������', 8200);
-- insert 2�� ���: �Ӽ� (�÷�)����Ʈ ���
insert into book(bookid, bookname, publisher, price)
values(12, '�װ�����', '���ָ���', 28000);
-- insert 3�� ���: �÷��� ������ ����
insert into book(bookid, price, publisher, bookname)
values(13, 28000, '�ð�', '����������');
-- insert 4�� ���: Ư�� �÷��� ���� ����
insert into book(bookid, price, bookname)
values(14, 16000, '������ ����');

-- ���̺� ������ ���� �ٸ� ���̺��� �������� �����ϴ� ���
insert into book(bookid, bookname, price, publisher)
SELECT bookid, bookname, price, publisher
from imported_book;

-- update: ������ ����
-- ����ȣ�� 5���� ���� �ּҸ� ���ѹα� �λ� �����Ͻÿ�.
SELECT * from customer;
update customer set address = '���ѹα� �λ�'
where custid = 5;

-- �ڼ��� ���� �ּҸ� �迬�� ���� �ּҿ� �����ϰ� �����Ͻÿ�.
update customer
set address = (SELECT address from customer
                where name = '�迬��')
where name = '�ڼ���';

-- �ڼ��� ���� ��ȭ��ȣ�� �迬�� ���� ��ȭ��ȣ�� �����ϰ� �����Ͻÿ�.
update customer
set phone = (SELECT phone from customer
                where name = '�迬��')
where name = '�ڼ���';

-- ��� ���� �����Ͻÿ�.
delete from customer;

SELECT * from orders;
SELECT * from customer;

-- �ڼ��� ���� �����Ͻÿ�.
DELETE from customer
where name = '�ڼ���';

insert into customer(custid, name)
values(5, '�ڼ���');

rollback;
commit;

-- 1�� �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
-- 2�� �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
-- 3�� ��ü ���� 30% �̻��� ������ ����