-- abs(-15)
select abs(-15) from dual; -- ���밪 ���ϱ�

-- ceil(1.7)
select ceil(1.7) from dual; -- �ø�

-- cos(3.14159)
select cos(3.14159) from dual; --�ڻ��� �� ���ϱ�

-- floor(15.7)
select floor(15.7) from dual; -- ����

-- log(10, 100)
select log(10, 100) from dual; -- �αװ� ���ϱ� (��Ʈ)

-- mod(11, 4)
select mod(11, 4) from dual; -- ������ ���ϱ�

-- power(3, 2)
select power(3, 2) from dual; -- ��������

-- round(15.7)
select round(15.7) from dual; -- �ݿø�

-- sign(-15)
select sign(-15) from dual; -- ���ڰ� �����̸� -1 ���

-- trunc(15.7)
SELECT trunc(15.7) from dual; -- �Ҽ��� ���� �ڸ��� ������

-- chr(67)
select chr(67) from dual; -- ���� �ƽ�Ű�ڵ带 ���ڷ� ��ȯ

-- concat('HAPPY', 'Birthday')
select concat('HAPPY', 'Birthday') from dual; -- �� �ܾ� ����

-- lower('Birthday')
select lower('Birthday') from dual; -- �빮�� > �ҹ��ڷ� ��ȯ

-- lpad('Page 1', 15, '*.')
select lpad('Page 1', 15, '*.') from dual; -- ���ʺ��� ������ �ڸ������� ������ ���ڷ� ä��

-- ltrim('Page 1', 'ae')
select ltrim('Page 1', 'ae') from dual; -- ��� ���ڿ��� ���ʺ��� ������ ���� ����

-- replace('JACK', 'J', 'BL')
select replace('JACK', 'J', 'BL') from dual; -- ������ ���ڸ� ���ϴ� ���ڷ� ����

-- rpad('Page 1', 15, '*.')
select rpad('Page 1', 15, '*.') from dual; -- �����ʺ��� ������ �ڸ������� ������ ���ڷ� ä��

-- rtrim('Page 1', 'ae')
select rtrim('Page 1', 'ae') from dual; -- ��� ���ڿ��� �����ʺ��� ������ ���� ����

-- substr('ABCDEFG', 3, 4)
SELECT substr('ABCDEFG', 3, 4) from dual;

-- trim(LEADING 0 FROM '00AA00')
SELECT trim(LEADING 0 FROM '00AA00') from dual;

-- upper('Birthday')
SELECT upper('Birthday') from dual;

-- ascii('A')
SELECT ascii('A') from dual;

-- instr('CORPORATE FLOOR', 'OR', 3, 2)
SELECT instr('CORPORATE FLOOR', 'OR', 3, 2) from dual;

-- length('Birthday')
SELECT length('Birthday') from dual;

-- SELECT length('Birthday') from dual;
SELECT add_months('14/05/21', 1) from dual;

-- last_day(sysdate)
SELECT last_day(sysdate) from dual;

-- next_day(sysdate, 'ȭ')
SELECT next_day(sysdate, 'ȭ') from dual;

-- round(sysdate)
SELECT round(sysdate) from dual;

-- sysdate
SELECT sysdate from dual;

-- to_char(sysdate)
SELECT to_char(sysdate) from dual;

-- to_char(123)
SELECT to_char(123) from dual;

-- to_date('12 05 2020', 'dd mm yyyy')
SELECT to_date('12 05 2020', 'dd mm yyyy') from dual;

-- to_number('12.3')
SELECT to_number('12.3') from dual;

-- decode(1, 1, 'aa', 'bb')
SELECT decode(1, 1, 'aa', 'bb') from dual;

-- nullif(123, 345)
SELECT nullif(123, 345) from dual;

-- nvl(null, 123)
SELECT nvl(null, 123) from dual;

-- ���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�. (��, ��ȭ��ȣ�� ���� ���� ����ó �������� ����Ͻÿ�.)
select name �̸�, phone ��ȭ��ȣ from customer;

select name �̸�, nvl(phone, '����ó����') ��ȭ��ȣ from customer; -- ��ü���ھ�

-- ����Ͽ��� ����, ����ȣ, �̸�, ��ȭ��ȣ�� ���� �θ� ����Ͻÿ�.
SELECT rownum ����, custid ����ȣ, name �̸�, phone ��ȭ��ȣ from customer;

SELECT rownum ����, custid ����ȣ, name �̸�, phone ��ȭ��ȣ from customer
where rownum <= 2;

-- Mybook ���̺� �����ϱ�
create table mybook(
    bookid number not null primary key,
    price number
);

-- ������ �� ����
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

select * from mybook; -- mybook ���̺� ���� ���

select bookid, nvl(price, 0) from mybook; -- nvl �Լ� �̿��Ͽ� �ΰ��� 0���� ��ȯ

select * from mybook
where price is null; -- ������ null�� ���� ���� �� ���

select * from mybook
where pirce = ''; -- null�� �� ������ �ƴ� ���� �������� ���� ���̱� ������ �����߻�

select bookid, price + 100 from mybook; -- ���ݿ� +100 �߰�, �ΰ��� ���� �ȵ�

select sum(price), avg(price), count(*) from mybook
where bookid >= 4; -- ���ʿ� bookid�� 4 �̻��� ���� ��� �ΰ� ���

select count(*), count(price) from mybook; -- �� ������ 3���� ������ ������ ���� ���� �� ���̶� �ΰ��� ���Ծȵż� ���

select sum(price), avg(price) from mybook; -- �ΰ��� ������ ���ݵ� ����

-- rownum�� ���� ����
select * from book; -- ��ü ���̺� ���

select * from book -- ������������ 5���� �� ���
where rownum <= 5;

select * from book  -- ���� �� ������������ 5���� �� ���
where rownum <= 5
order by price;

select * from (select * from book
                order by price)b
where rownum <= 5; -- �������� ������ �Ǿ��ִ� ���̺��� �ٽ� 5���� �� �������� ���(������ ���ݼ����� ���)

select * from(select * from book -- ���� �� ������������ 5���� �� ���
                where rownum <= 5)b
order by price;

select * from(select * from book -- ���� �� ������������ 5���� �� ���
                where rownum <= 5
                order by price)b;
                
-- ����Ǹűݾ� ������ �ֹ��� ���� �ֹ���ȣ�� �ݾ��� ���
select avg(saleprice) from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice <= (select avg(saleprice) from orders);

-- �� ���� ����Ǹűݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ��� �ֹ���ȣ, ����ȣ, �Ǹűݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders mo -- mo��� ������ �̸� ������ (main order�� ����)
where saleprice > (select avg(saleprice) from orders so                  -- �̰͵� ���� ����   
                    where mo.custid = so.custid);

-- ���Ǹűݾ�
select sum(saleprice) ���Ǹž� from orders;
-- ���￡ �����ϴ� ����� ����ȣ
select custid from customer
where address like '%����%';
-- ���� �����ڿ� �ּ�
select name, address from customer
where custid in(select custid from customer
                where address like '%����%');
-- ���ѹα��� �����ϴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�.
select sum(saleprice) ���Ǹž� from orders
where custid in(select custid from customer
                where address like '%����%');

-- ���ѹα��� ���������ʴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�.
select sum(saleprice) ���Ǹž� from orders
where custid not in(select custid from customer
                where address like '%����%');

-- ��� �ֹ���ȣ, �ݾ�
select orderid �ֹ���ȣ, saleprice �ݾ� from orders;
-- 3�� ���� �ֹ��� �ݾ�
select saleprice from orders
where custid = 3;
-- 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �ݾ� from orders
where saleprice > all(select saleprice from orders
                        where custid = 3);

-- ���￡ �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�.(��, exists ������ ���)
select sum(saleprice) "�� �Ǹűݾ�" from orders o
where EXISTS(select * from customer c
                where address like '%����%' and c.custid = o.custid);
                
-- ���� �Ǹűݾ��� �հ踦 ���(����ȣ, �Ǹ��հ�)
select sum(saleprice) �Ǹ��հ�, custid ����ȣ from orders
group by custid;
-- ���� �Ǹűݾ��� �հ踦 ���(����, �Ǹ��հ�)
select (select name from customer c
        where c.custid = o.custid) �̸�, sum(saleprice) �Ǹ��հ� from orders o
group by o.custid;

-- �ֹ���Ͽ� å�̸��� ������ �� �ִ� �÷��� �߰��Ͻÿ�.
alter table orders add bookname VARCHAR2(40);

update orders set bookname = (select bookname from book
                                where book.bookid = orders.bookid);
                                
-- ����ȣ�� 2 ������ ����ȣ�� �̸��� ����Ͻÿ�.
select custid ����ȣ, name �̸� from customer
where custid <= 2;

-- ����ȣ�� 2 ������ ���� �Ǹűݾ��� ����Ͻÿ�.(���̸��� ���� �Ǹž� ���)
select name �̸�, sum(saleprice) �Ǹ��Ѿ�
from (select custid, name from customer
        where custid <= 2) c, orders o
where c.custid = o.custid
group by c.name;

-- ��������
select custid, (select address from customer c -- ����ȣ���� �ּҿ� �Ǹűݾ� �հ踦 ����ϴ� sql��
                where c.custid = o.custid) �ּ�, sum(saleprice) �հ�
from orders o
group by o.custid;