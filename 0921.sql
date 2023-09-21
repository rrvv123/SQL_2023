-- 1�� �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
-- (�������� ������ ������ ���ǻ��̸��� ����Ͻÿ�.)
select publisher from customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid = bs.bookid
and name = '������'; -- name like '������' �ص���

SELECT name from customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid = bs.bookid
and name not like '������'
and publisher in(select publisher from customer cs, orders os, book bs
                where cs.custid = os.custid and os.bookid = bs.bookid
                and name = '������');

-- 2�� �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
SELECT name from customer cs
where (select count(DISTINCT publisher) from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid and name like cs.name) >= 2;

-- 3�� ��ü ���� 30% �̻��� ������ �����̸� ���
SELECT bookname from book b
where (select count(bk.bookid) from orders o, book bk
        where bK.bookid = o.bookid and bk.bookid = b.bookid) >= (select count(*) from customer)*0.3;

-- ���ο� ���� ('������ ����', '���ѹ̵��', 10000��)�� ���缭���� �԰�Ǿ���.
-- ������ �ȵ� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ���
insert into book
values(9, '������ ����', '���ѹ̵��', 10000);

-- '�����'���� ������ ������ �����ؾ� �Ѵ�
DELETE from book
where publisher = '�����';

select * from book;

-- '�̻�̵��'���� ������ ������ �����ؾ� �Ѵ�. ������ �ȵ� ��� ������ �����غ���
DELETE from book
where publisher = '�̻�̵��'; -- ���Ἲ ���������� ����Ǿ, �̹� �θ� �ڽ� ������ ���̺�
--  ���� �ش� ���ǻ��� ���������� �����Ұ�.

-- ���ǻ� '���ѹ̵��'�� '�������ǻ�'�� �̸��� �ٲپ���.
UPDATE book
set publisher = '�������ǻ�'
where publisher = '���ѹ̵��';

--------------------------�����Լ�-----------------------------------------
-- abs: ���밪 ���ϴ� �Լ�
SELECT abs(-33), abs(+33) "���밪" from dual; -- dual�� �Ͻ������� ����ϴ� ������ ���̺��� �̿���

-- 5.657�� �Ҽ� ù°�ڸ����� �ݿø��� ���� ���Ͻÿ�.
SELECT round(5.657, 1) from dual;

-- ���� ��� �ֹ��ݾ��� ��������� �ݿø��� ���� ���Ͻÿ�.
SELECT custid "����ȣ", round(avg(saleprice), -2) "��ձݾ�" from orders
group by custid;

-- ������ '����'�� ���Ե� ������ '����'���� �����Ͽ� ����Ͻÿ�.
-- ���� book���̺��� ���������͸� �����ϸ� �ȵȴ�.
SELECT bookid, replace(bookname, '����', '����') bookname, publisher, price from book;
select * from book;

-- '�½�����'���� ������ ������ ����� ������ ���� ��, ����Ʈ ���� ����Ͻÿ�.
SELECT bookname "������", length(bookname) "���� ��", lengthb(bookname) "����Ʈ ��" from book
where publisher = '�½�����';

-- ���߿��� ���� ������ ���� ����� ������� �������� �ο����� ����Ͻÿ�.
select substr(name, 1, 1) "��", count(*) "�ο� ��" from customer
group by substr(name, 1, 1);

-- ������ �ֹ�Ȯ������ �ֹ��Ϸκ��� 10�� ���̴�. �ֹ���ȣ, �ֹ���, �ֹ�Ȯ������ ����Ͻÿ�.
SELECT orderid �ֹ���ȣ, orderdate �ֹ���, orderdate+10 �ֹ�Ȯ���� from orders
order by orderid;

-- 2023�� 8�� 28�Ͽ� �ֹ����� �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ����Ͻÿ�.
-- ��, '�ֹ����� yyyy-m-m-dd ��'�� ���� format���� ǥ���Ͻÿ�.
SELECT orderid �ֹ���ȣ, to_char(orderdate, 'yyyy-mm-dd') �ֹ���, name ����ȣ, bookname ������ȣ from orders, customer, book
where orderdate = to_date('20230828', 'yyyymmdd');

-- 2023�� 8�� 28�Ͽ� �ֹ����� �ֹ���ȣ, �ֹ���, ����, �������� ��� ����Ͻÿ�.
-- ��, '�ֹ����� yyyy-mm-dd ��'�� ���� format���� ǥ���Ͻÿ�.
SELECT orderid �ֹ���ȣ, to_char(orderdate, 'yyyy-mm-dd') �ֹ���, name ����, bookname ������ from orders o, customer c, book b
where o.bookid = b.bookid and o.custid = c.custid
and orderdate = to_date('20230828', 'yyyymmdd'); -- �θ� �ڽİ��� ���� �� �����ؼ� ���Ǻο� ���ֱ�

-- DB ������ ������ ��¥�� �ð� ������ ����Ͻÿ�.
-- ���� ��ȯ�� ��¥�� ������ ������(�⵵ 4�ڸ�/�� 2�ڸ�/ ��¥ 2�ڸ� ������ ���� ��:��:��) ��¥�� �ð� 2������ ����Ͻÿ�.
select sysdate, to_char(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1" from dual;