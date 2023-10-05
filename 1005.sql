-- �ֹ��� �� ���� �̸�, ��� ���Ű����� ���Ͻÿ�
select cs.name, s from (select custid, avg(saleprice) s
                        from orders
                        group by custid)od, customer cs
where cs.custid = od.custid;

-- ����ȣ�� 3���� ���� ���� �Ǹűݾ��� �հ踦 ���Ͻÿ�
select sum(saleprice) "total" from orders od -- ����ȣ�� 3 ������ ������ ���Ű����� �հ踦 ���ϴ� SQL��
where exists (select * from customer cs
                where custid <= 3 and cs.custid = od.custid);

-- view ���̺� �����
-- å�̸��� �����̶�� �ܾ ���Ե� ������� ����Ͻÿ�.
select * from book;

select * from book
where bookname like '%����%';

create view v_book
as select * from book
where bookname like '%����%';

-- �ּҿ� �����̶�� �ܾ ���Ե� �並 �����Ͻÿ�.
select * from customer
where address like '%����%';

create view vw_customer
as select * from customer
where address like '%����%';

select * from vw_customer;

-- �ֹ����̺��� ���̸�, �����̸��� �ٷ� Ȯ���� �� �ִ� �並 ������ ��,
-- �迬�� ���� ������ ������ �ֹ���ȣ, ������, �ֹ����� ����Ͻÿ�.
create view vw_orders(orderid, name, custid, bookid, bookname, saleprice, orderdate)
as select o.orderid, c.name, o.custid, o.bookid, b.bookname, o.saleprice, o.orderdate
    from orders o, customer c, book b
    where o.custid = c.custid and o.bookid = b.bookid;
    
select * from vw_orders;

select orderid, bookname, saleprice from vw_orders
where name = '�迬��';

-- ������ �並 �����Ѵ�.
create or replace view vw_customer(custid, name, address)
as select custid, name, address
from customer
where address like '%����%';

select * from customer;

select * from vw_customer;

-- �� ����
drop view vw_customer;

-- ������ �ش��ϴ� �並 �ۼ��Ͻÿ�. �����ͺ��̽��� ���缭�� �����ͺ��̽��� �̿��Ѵ�.
-- 1�� �ǸŰ����� 20,000�� �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ� highorders �並 �����Ͻÿ�.
create view highorders(bookid, bookname, name, publisher, saleprice)
as select b.bookid, b.bookname, c.name, b.publisher, o.saleprice
from book b, customer c, orders o
where b.bookid = o.bookid and c.custid = o.custid;

select * from highorders;
-- 2�� ������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ����ϴ� SQL���� �ۼ��Ͻÿ�.
select bookname, name from highorders;

-- 3�� highorders �並 �����ϰ��� �Ѵ�. �ǸŰ��� �Ӽ��� �����ϴ� ����� �����Ͻÿ�. ���� �� 2�� SQL���� �ٽ� �����Ͻÿ�.
create or replace view highorders
as select o.bookid, b.bookname, c.name, b.publisher
from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid and saleprice >= 20000;

-- insertbook ���ν��� ����
exec insertbook(15, '����������', '������м���', 25000);

select * from book;

exec insertorupdate(16, '������ ��ſ�', '������м���', 30000);

exec insertorupdate(16, '������ ��ſ�', '������м���', 20000);

set serveroutput on;
declare
    averageVal number;
begin
    averagePrice(averageVal);
    dbms_output.put_line('������հ���: '||averageVal);
end;