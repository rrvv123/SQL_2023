insert into orders VALUES (1, 1, 1, 6000, TO_DATE('2023-01-10', 'yyyy-mm-dd'));
insert into orders VALUES (2, 1, 3, 21000, TO_DATE('2023-03-15', 'yyyy-mm-dd'));
insert into orders VALUES (3, 2, 5, 8000, TO_DATE('2022-11-07', 'yyyy-mm-dd'));
insert into orders VALUES (4, 3, 6, 6000, TO_DATE('2023-07-12', 'yyyy-mm-dd'));
insert into orders VALUES (5, 4, 7, 20000, TO_DATE('2023-07-07', 'yyyy-mm-dd'));
insert into orders VALUES (6, 1, 2, 12000, TO_DATE('2022-11-14', 'yyyy-mm-dd'));
insert into orders VALUES (7, 4, 8, 13000, TO_DATE('2023-08-28', 'yyyy-mm-dd'));
insert into orders VALUES (8, 3, 10, 12000, TO_DATE('2023-08-04', 'yyyy-mm-dd'));
insert into orders VALUES (9, 2, 10, 7000, TO_DATE('2022-10-29', 'yyyy-mm-dd'));
insert into orders VALUES (10, 3, 8, 13000, TO_DATE('2022-10-04', 'yyyy-mm-dd'));

INSERT into imported_book VALUES(21, 'Zen Golf', 'Person', 12000);
INSERT into imported_book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);

SELECT publisher, price from book
where bookname like '�౸�� ����';

SELECT name, address, phone from customer WHERE name='�迬��';

SELECT * from customer WHERE name='�迬��';

-- book���̺��� ������� ������ �˻��Ͻÿ�.
SELECT bookname, price from book;

-- book���̺��� ���ݰ� �������� �˻��Ͻÿ�.
SELECT price, bookname from book;

--book���̺��� ������ȣ, ������, ���ǻ�, ������ �˻��Ͻÿ�.
SELECT * from book;

--book���̺��� ��� ���ǻ縦 �˻��Ͻÿ�.
SELECT DISTINCT publisher from book;

--book���̺��� ������ 20000�� �̸��� ������ �˻��Ͻÿ�.
SELECT * from book
where price < 20000;

--book���̺��� ������ 10000�� �̻� 20000 ������ ������ �˻��Ͻÿ�.
SELECT * from book
where price BETWEEN 10000 and 20000;
--book���̺��� between and �� ������� ���ÿ�.

SELECT * from book
where price >= 10000 and price <= 20000;

--book ���̺��� ���ǻ簡 ��ũ��, �̻�̵���� ������ �˻��Ͻÿ�.
--�� in �����ڸ� ����Ͽ� �˻�.
SELECT * from book
where publisher in ('��ũ��', '�̻�̵��');

--book ���̺��� ���ǻ簡 ��ũ��, �̻�̵���� ������ �˻��Ͻÿ�.
--�� in �����ڸ� ������� ���ÿ�. (�񱳿����ڿ� or������ ���)
SELECT * from book
where publisher = '��ũ��' or publisher = '�̻�̵��';

--book ���̺��� ���ǻ簡 ��ũ��, �̻�̵� �ƴ� ������ �˻��Ͻÿ�.
SELECT * from book
where publisher not in ('��ũ��', '�̻�̵��');

--book ���̺��� ���ǻ簡 ��ũ��, �̻�̵� �ƴ� ������ �˻��Ͻÿ�.
--�� not in �����ڸ� ������� ���ÿ�.(�񱳿����ڿ� snd ������ ���)
SELECT * from book
where publisher <> '��ũ��' and publisher <> '�̻�̵��';

--book���̺��� �������� �౸�� ������ ���� �˻��Ͻÿ�.
SELECT * from book
where bookname like '�౸�� ����';

SELECT * from book
where bookname = '�౸�� ����';

-- book ���̺��� ������ �౸��� ���ڿ��� ���Ե� ���� �˻��Ͻÿ�.
SELECT * from book
where bookname like '%�౸%';

-- book ���̺��� ������ �����̶�� ���ڿ��� ���Ե� ���� �˻��Ͻÿ�.
SELECT * from book
where bookname like '%����%';

--book ���̺��� ������ �����̶�� ���ڿ��� ������ ���� �˻��Ͻÿ�.
SELECT * from book
where bookname like '%����';
--book���̺��� ������ '��'�� �տ� ������ 3���ڰ� ���� ���� �˻��Ͻÿ�.
SELECT * from book
where bookname like '__��%';