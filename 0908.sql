-- ���տ�����: ������(UNION), ������(MINUS), ������(INTERSECT)
-- ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�.
SELECT name from customer;

SELECT distinct custid from orders;

select name from customer
where custid in (select custid from orders);
-- ������ ������ ����� ���
SELECT name from customer
MINUS
select name from customer
where custid in (select DISTINCT custid from orders);
-- ������ ������� ���� ���
SELECT name from customer
where custid not in (select DISTINCT custid from orders);

-- EXISTS: ���������� ����� �����ϴ� ��쿡 TRUE
-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ����Ͻÿ�.
-- in������ ����� ���
SELECT name, address from customer
where custid in (select distinct custid from orders); -- ���� ���ð� ���� SQL��
-- �������ΰ� �ߺ��� ���Ÿ� ����� ���
SELECT distinct name, address from customer c, orders o
where o.custid = c.custid;
-- EXISTS ����� ���
SELECT name, address from customer c
where EXISTS (SELECT * from orders o
                where c.custid = o.custid);
                
-- �������� ������ ������ ���ǻ� ��
SELECT COUNT(*) PUBLISHER FROM BOOK b
WHERE b.BOOKID in (select bookid from ORDERS o, customer c
                            where c.name = '������');
                            
SELECT COUNT(*) PUBLISHER
FROM BOOK, ORDERS
WHERE book.BOOKID = orders.BOOKID
AND ORDERS.CUSTID = 1;

-- �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select b.bookname ������, o.saleprice ����, b.price - o.saleprice "������ �ǸŰ� ����" from book b, orders o
where b.bookid = o.bookid and o.custid = 1;

-- �������� �������� ���� ������ �̸�
SELECT bookname from book
MINUS
select b.bookname ������ from book b, orders o
where b.bookid = o.bookid and o.custid = 1;

-- �ֹ����� ���� ���� �̸�(�μ����� ���)
SELECT name from customer
MINUS
select name from customer
where custid in (select DISTINCT custid from orders);

-- �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
SELECT sum(saleprice) �Ѿ�, avg(saleprice) "��� �ݾ�" from orders;

-- ���� �̸��� ���� ���ž�
SELECT name, sum(saleprice) ���ž� from customer c, orders o
where c.custid = o.custid
group by name;

-- ���� �̸��� ���� ������ ���� ���
SELECT name, bookname from customer c, orders o, book b
where c.custid = o.custid and b.bookid = o.bookid
order by name;

-- ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�
SELECT * FROM book, ORDERS
WHERE book.BOOKID = orders.BOOKID AND book.PRICE - orders.SALEPRICE = (SELECT max(book.PRICE - orders.SALEPRICE)
                                                                        FROM book, ORDERS
                                                                        WHERE book.BOOKID = orders.BOOKID);

-- ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
SELECT name, avg(saleprice) from customer c, orders o
where c.custid = o.custid
group by name
HAVING avg(o.saleprice) > (select avg(o.saleprice) from orders o);
--�Ǹž� ���
SELECT avg(saleprice) from orders o;

-- DDL(Data Defination Language): ������ ���Ǿ�
-- create table/ alter table/drop table
-- ���̺� ���� ����1
create table NewBook1(
    bookid number,
    bookname varchar2(20),
    publisher VARCHAR2(20),
    price number
);

-- ���̺� ���� ����2
-- primary key ���� ���1
create table NewBook2(
    bookid number,
    bookname varchar2(20),
    publisher VARCHAR2(20),
    price number,
    PRIMARY KEY (bookid)
);

--  primary key ���� ���2
create table NewBook3(
    bookid number PRIMARY KEY,
    bookname varchar2(20),
    publisher VARCHAR2(20),
    price number
);

-- bookname �÷�: null�� ���� �� ����
-- publisher �÷�: ������ ���� ���� �� ����
-- price �÷�: ������ �ԷµǾ����� ���� ��� �⺻�� 10000��, �Էµ� ���� �ּ� 1000�� �̻����� ��
-- bookname, publisher �÷��� ����Ű�� ����
create table NewBook4(
    bookname varchar2(20) NOT NULL,
    publisher VARCHAR2(20) UNIQUE,
    price number DEFAULT 10000 check(price > 1000),
    PRIMARY KEY (bookname, publisher)
);