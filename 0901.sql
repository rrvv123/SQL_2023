SELECT * from book;

-- book ���̺��� �����̶�� ���ڿ��� �����ϰ� ���������� 15000�� �̻��� ������ ���� �˻��Ͻÿ�.
SELECT * from book
where bookname like '%����%' and price >= 15000;

-- book ���̺��� ���ǻ簡 �½����� �Ǵ� �̻�̵���� ������ �˻��Ͻÿ�.
SELECT * from book
-- where publisher = '�½�����' or publisher = '�̻�̵��';
-- in �����ڸ� ����Ͽ� ����
where publisher in ('�½�����', '�̻�̵��');

-- book ���̺��� ����������� �˻��Ͻÿ�.
SELECT * from book
order by bookname;

-- book���̺��� ������ȣ������ �˻��Ͻÿ�.
SELECT * from book
order by bookid;

-- book���̺��� ���ݼ����� �˻��� �ϰ� ���� �����̸� �̸������� �˻��Ͻÿ�.
SELECT * from book
order by price, bookname;

-- book ���̺��� ������ ������������ �˻��ϰ� ���� �����̸� ���ǻ������ �˻��Ͻÿ�.
SELECT * from book
order by price DESC, publisher ASC;

SELECT * from orders;
-- orders ���̺��� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
-- �����Լ��� ���(�հ�: sum)
SELECT SUM(saleprice) from orders;

SELECT SUM(saleprice) as �Ѹ��� from orders;

-- orders ���̺��� �� ��ȣ�� 1�� ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�.
SELECT sum(saleprice) as ���Ǹž� from orders
WHERE custid = 1;

-- orders ���̺��� ���Ǹž��� �հ�, ���, �ּҰ�, �ִ밪�� ���Ͻÿ�.
SELECT SUM(saleprice) AS ���Ǹűݾ�,
        avg(saleprice) AS �Ǹž����,
        min(saleprice) AS ��������,
        max(saleprice) AS �ִ밡��
from orders;

-- orders ���̺��� ���������� 13000�� �̻��� ������ ������ ���Ͻÿ�.
SELECT count(*)
from orders
where saleprice >= 13000;

-- orders ���̺��� ����ȣ�� 1 �Ǵ� 3�� ���� �ֹ� ������ ���Ͻÿ�.
SELECT COUNT(*)
from orders
where custid in (1, 3); -- custid = 1 or custid = 3

-- orders ���̺��� ���� �ֹ��� ������ ������ ���հ踦 ���Ͻÿ�.
-- �׷�ȭ(�κ���): group by 
SELECT custid as "�� �ֹ���ȣ", count(*) �ֹ�����, sum(saleprice) �ֹ��Ѿ� from orders
group by custid
order by custid;

-- orders ���̺��� �ǸŰ����� 8000�� �̻��� ������ ������ ���� ���� ���� �ֹ� ������ �� ������ ���Ͻÿ�.
-- �� 2�� �̻� ������ ���� ����Ͻÿ�.
SELECT custid ����ȣ, count(*) as �������� from orders
where saleprice >= 8000
group by custid
HAVING count(*) >= 2
order by custid;


-------------------����--------------------
--������ȣ�� 1�� ������ �̸�
SELECT bookid, bookname from book
where bookid = 1;

--������ 20000�� �̻��� ������ �̸�
SELECT bookname, price from book
where price >= 20000;

--�������� �� ���ž�(�������� ����ȣ�� 1������ ���� �ۼ�)
SELECT sum(saleprice) as "�������� �� ���ž�" from orders
where custid = 1;

--�������� ������ ������ ��(�������� ����ȣ�� 1������ ���� �ۼ�)
SELECT count(*) from orders
where custid = 1;

--���缭�� ������ �� ����
SELECT count(bookid) as "���缭�� ���� �� ����" from book;

--���缭���� ������ ����ϴ� ���ǻ��� �� ����
SELECT count(distinct publisher) as "���ǻ� ��" from book;

--��� ���� �̸�, �ּ�
SELECT name, address from customer;

--2014�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ� ���� ������ �ֹ���ȣ
SELECT BOOKID as �ֹ���ȣ FROM orders
WHERE orderdate BETWEEN '2014/07/04' AND '2014/07/07'
ORDER BY BOOKID;

--2014�� 7�� 4�� ~ 7�� 7�� ���̿� �ֹ� ���� ������ ������ ������ �ֹ���ȣ
SELECT DISTINCT BOOKID as �ֹ���ȣ FROM orders
WHERE orderdate NOT BETWEEN '2014/07/04' AND '2014/07/07'
ORDER BY BOOKID;

--���� '��'���� ���� �̸��� �ּ�
SELECT name, address from customer
where name like '��%';

--���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
SELECT name, address from customer
where name like '��_��';