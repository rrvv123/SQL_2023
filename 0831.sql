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
where bookname like '축구의 역사';

SELECT name, address, phone from customer WHERE name='김연아';

SELECT * from customer WHERE name='김연아';

-- book테이블에서 도서명과 가격을 검색하시오.
SELECT bookname, price from book;

-- book테이블에서 가격과 도서명을 검색하시오.
SELECT price, bookname from book;

--book테이블에서 도서번호, 도서명, 출판사, 가격을 검색하시오.
SELECT * from book;

--book테이블에서 모든 출판사를 검색하시오.
SELECT DISTINCT publisher from book;

--book테이블에서 가격이 20000원 미만인 도서를 검색하시오.
SELECT * from book
where price < 20000;

--book테이블에서 가격이 10000원 이상 20000 이하인 도서를 검색하시오.
SELECT * from book
where price BETWEEN 10000 and 20000;
--book테이블에서 between and 를 사용하지 마시오.

SELECT * from book
where price >= 10000 and price <= 20000;

--book 테이블에서 출판사가 핑크퐁, 이상미디어인 도서를 검색하시오.
--단 in 연산자를 사용하여 검색.
SELECT * from book
where publisher in ('핑크퐁', '이상미디어');

--book 테이블에서 출판사가 핑크퐁, 이상미디어인 도서를 검색하시오.
--단 in 연산자를 사용하지 마시오. (비교연산자와 or연산자 사용)
SELECT * from book
where publisher = '핑크퐁' or publisher = '이상미디어';

--book 테이블에서 출판사가 핑크퐁, 이상미디어가 아닌 도서를 검색하시오.
SELECT * from book
where publisher not in ('핑크퐁', '이상미디어');

--book 테이블에서 출판사가 핑크퐁, 이상미디어가 아닌 도서를 검색하시오.
--단 not in 연산자를 사용하지 마시오.(비교연산자와 snd 연산자 사용)
SELECT * from book
where publisher <> '핑크퐁' and publisher <> '이상미디어';

--book테이블에서 도서명이 축구의 역사인 행을 검색하시오.
SELECT * from book
where bookname like '축구의 역사';

SELECT * from book
where bookname = '축구의 역사';

-- book 테이블에서 도서명에 축구라는 문자열이 포함된 행을 검색하시오.
SELECT * from book
where bookname like '%축구%';

-- book 테이블에서 도서명에 과학이라는 문자열이 포함된 행을 검색하시오.
SELECT * from book
where bookname like '%과학%';

--book 테이블에서 도서명에 과학이라는 문자열로 끝나는 행을 검색하시오.
SELECT * from book
where bookname like '%과학';
--book테이블에서 도서명에 '의'자 앞에 임의의 3글자가 들어가는 행을 검색하시오.
SELECT * from book
where bookname like '__의%';