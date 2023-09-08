-- 집합연산자: 합집합(UNION), 차집합(MINUS), 교집합(INTERSECT)
-- 도서를 주문하지 않은 고객의 이름을 보이시오.
SELECT name from customer;

SELECT distinct custid from orders;

select name from customer
where custid in (select custid from orders);
-- 차집합 연산자 사용한 경우
SELECT name from customer
MINUS
select name from customer
where custid in (select DISTINCT custid from orders);
-- 연산자 사용하지 않은 경우
SELECT name from customer
where custid not in (select DISTINCT custid from orders);

-- EXISTS: 서브쿼리의 결과가 존재하는 경우에 TRUE
-- 주문이 있는 고객의 이름과 주소를 출력하시오.
-- in연산자 사용한 경우
SELECT name, address from customer
where custid in (select distinct custid from orders); -- 제일 사용시간 적은 SQL문
-- 동등조인과 중복행 제거를 사용한 경우
SELECT distinct name, address from customer c, orders o
where o.custid = c.custid;
-- EXISTS 사용한 경우
SELECT name, address from customer c
where EXISTS (SELECT * from orders o
                where c.custid = o.custid);
                
-- 박지성이 구매한 도서의 출판사 수
SELECT COUNT(*) PUBLISHER FROM BOOK b
WHERE b.BOOKID in (select bookid from ORDERS o, customer c
                            where c.name = '박지성');
                            
SELECT COUNT(*) PUBLISHER
FROM BOOK, ORDERS
WHERE book.BOOKID = orders.BOOKID
AND ORDERS.CUSTID = 1;

-- 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select b.bookname 도서명, o.saleprice 가격, b.price - o.saleprice "정가와 판매가 차이" from book b, orders o
where b.bookid = o.bookid and o.custid = 1;

-- 박지성이 구매하지 않은 도서의 이름
SELECT bookname from book
MINUS
select b.bookname 도서명 from book b, orders o
where b.bookid = o.bookid and o.custid = 1;

-- 주문하지 않은 고객의 이름(부속질의 사용)
SELECT name from customer
MINUS
select name from customer
where custid in (select DISTINCT custid from orders);

-- 주문 금액의 총액과 주문의 평균 금액
SELECT sum(saleprice) 총액, avg(saleprice) "평균 금액" from orders;

-- 고객의 이름과 고객별 구매액
SELECT name, sum(saleprice) 구매액 from customer c, orders o
where c.custid = o.custid
group by name;

-- 고객의 이름과 고객이 구매한 도서 목록
SELECT name, bookname from customer c, orders o, book b
where c.custid = o.custid and b.bookid = o.bookid
order by name;

-- 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
SELECT * FROM book, ORDERS
WHERE book.BOOKID = orders.BOOKID AND book.PRICE - orders.SALEPRICE = (SELECT max(book.PRICE - orders.SALEPRICE)
                                                                        FROM book, ORDERS
                                                                        WHERE book.BOOKID = orders.BOOKID);

-- 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
SELECT name, avg(saleprice) from customer c, orders o
where c.custid = o.custid
group by name
HAVING avg(o.saleprice) > (select avg(o.saleprice) from orders o);
--판매액 평균
SELECT avg(saleprice) from orders o;

-- DDL(Data Defination Language): 데이터 정의어
-- create table/ alter table/drop table
-- 테이블 생성 연습1
create table NewBook1(
    bookid number,
    bookname varchar2(20),
    publisher VARCHAR2(20),
    price number
);

-- 테이블 생성 연습2
-- primary key 설정 방법1
create table NewBook2(
    bookid number,
    bookname varchar2(20),
    publisher VARCHAR2(20),
    price number,
    PRIMARY KEY (bookid)
);

--  primary key 설정 방법2
create table NewBook3(
    bookid number PRIMARY KEY,
    bookname varchar2(20),
    publisher VARCHAR2(20),
    price number
);

-- bookname 컬럼: null값 가질 수 없음
-- publisher 컬럼: 동일한 값을 가질 수 없음
-- price 컬럼: 가격이 입력되어있지 않은 경우 기본값 10000원, 입력될 때는 최소 1000원 이상으로 함
-- bookname, publisher 컬럼을 복합키로 설정
create table NewBook4(
    bookname varchar2(20) NOT NULL,
    publisher VARCHAR2(20) UNIQUE,
    price number DEFAULT 10000 check(price > 1000),
    PRIMARY KEY (bookname, publisher)
);