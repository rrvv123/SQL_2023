-- ��������(Equi Join)
-- �������� ���̺��� ������ �� Ư�� �÷��� ���� ���� ��鸸 �˻��� �� ���

--���� ���� �ֹ��� ���� �����͸� ��� ����Ͻÿ�.
SELECT * from customer, orders
where orders.custid = customer.custid;

-- ���� ���� �ֹ��� ���� �����͸� ��� ����ȣ ������������ ����Ͻÿ�.
SELECT * from customer, orders
where orders.custid = customer.custid
order by customer.custid desc;
-- ���� ���� �ֹ��� ���� �����͸� ��� ����ȣ �̸������������� ����Ͻÿ�.
SELECT * from customer, orders
where orders.custid = customer.custid
order by name desc;

-- ���� �̸�, ���� �ֹ��� ���� �ǸŰ����� �˻��Ͻÿ�.
SELECT name, saleprice from customer c, orders o
where c.custid = o.custid;

-- �� �̸����� �ֹ��� ��� ������ ���Ǹž��� ���ϰ�, ���̸������� �����Ͻÿ�.
SELECT name, sum(saleprice) from customer c, orders o
where c.custid = o.custid
group by name
order by name;

-- ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�.
-- 3���� ���̺� ���� ��������(Equi Join)
SELECT name, bookname from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid
order by name;

-- ���������� 16000���� ������ �ֹ��� ���̸��� �����̸��� ����Ͻÿ�.
SELECT c.name, b.bookname from customer c, book b, orders o
where c.custid = o.custid and o.bookid = b.bookid and b.price = 20000;

-- �ܺ�����(Outer Join)
-- ���������� �ϰԵǸ� ���� �������� ���� ���� ���õ�����
-- �ܺ������� �ϰԵǸ� ������ �Ǵ� ���̺��� ���� �������� ���� ������ �൵ �����ؼ� ������ش�.

-- ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�.
SELECT name, saleprice
from customer c left outer join orders o
                on c.custid = o.custid;
                
-- Sub Query(�μ� ����)
-- Main Query���� �ִ� Query

-- ���������� ���� ��� ����
SELECT max(price) from book;
-- �����̸�
SELECT bookname from book;
-- ���������� ���� ��� �����̸��� ����Ͻÿ�.
SELECT bookname from book
where price = (select max (price)
                from book);

-- question ���������� ���� �� ������ �̸��� ������ ����Ͻÿ�.
SELECT bookname, price from book
where price = (SELECT min (price)
                from book);

-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
SELECT name from customer
where custid in (select distinct custid from orders);
-- sub query: �ֹ��� ���� �ִ� ����ȣ��
select distinct custid from orders;

-- å ������ �� �̸�
SELECT name from customer;
-- ���ǻ簡 �̻�̵��
SELECT bookname from book
where publisher = '�̻�̵��';
-- ������ ������ �� ���̵�
SELECT distinct custid from orders;
-- �̻�̵��� ������ ������ ������ ���� �̸��� ����Ͻÿ�.
SELECT name from customer
where custid in (SELECT distinct custid from orders
                    where bookid in (SELECT bookid from book
                                        where publisher = '�̻�̵��'));
-- �������� �ٲ� SQL��
SELECT distinct name from customer c, book b, orders o
where c.custid = o.custid and b.bookid = o.bookid and b.publisher = '�̻�̵��';