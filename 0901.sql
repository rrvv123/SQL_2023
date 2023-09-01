SELECT * from book;

-- book 테이블에서 과학이라는 문자열을 포함하고 도서가격이 15000원 이상인 데이터 행을 검색하시오.
SELECT * from book
where bookname like '%과학%' and price >= 15000;

-- book 테이블에서 출판사가 굿스포츠 또는 이상미디어인 도서를 검색하시오.
SELECT * from book
-- where publisher = '굿스포츠' or publisher = '이상미디어';
-- in 연산자를 사용하여 수정
where publisher in ('굿스포츠', '이상미디어');

-- book 테이블에서 도서명순으로 검색하시오.
SELECT * from book
order by bookname;

-- book테이블에서 도서번호순으로 검색하시오.
SELECT * from book
order by bookid;

-- book테이블에서 가격순으로 검색을 하고 같은 가격이면 이름순으로 검색하시오.
SELECT * from book
order by price, bookname;

-- book 테이블에서 가격을 내림차순으로 검색하고 같은 가격이면 출판사순으로 검색하시오.
SELECT * from book
order by price DESC, publisher ASC;

SELECT * from orders;
-- orders 테이블에서 고객이 주문한 도서의 총 판매액을 구하시오.
-- 집계함수를 사용(합계: sum)
SELECT SUM(saleprice) from orders;

SELECT SUM(saleprice) as 총매출 from orders;

-- orders 테이블에서 고객 번호가 1인 고객이 주문한 도서의 총판매액을 구하시오.
SELECT sum(saleprice) as 총판매액 from orders
WHERE custid = 1;

-- orders 테이블에서 총판매액의 합계, 평균, 최소값, 최대값을 구하시오.
SELECT SUM(saleprice) AS 총판매금액,
        avg(saleprice) AS 판매액평균,
        min(saleprice) AS 최저가격,
        max(saleprice) AS 최대가격
from orders;

-- orders 테이블에서 도서가격이 13000원 이상인 도서의 개수를 구하시오.
SELECT count(*)
from orders
where saleprice >= 13000;

-- orders 테이블에서 고객번호가 1 또는 3인 고객의 주문 개수를 구하시오.
SELECT COUNT(*)
from orders
where custid in (1, 3); -- custid = 1 or custid = 3

-- orders 테이블에서 고객별 주문한 도서의 개수와 총합계를 구하시오.
-- 그룹화(부분합): group by 
SELECT custid as "고객 주문번호", count(*) 주문수량, sum(saleprice) 주문총액 from orders
group by custid
order by custid;

-- orders 테이블에서 판매가격이 8000원 이상인 도서를 구매한 고객에 대해 고객별 주문 도서의 총 수량을 구하시오.
-- 단 2권 이상 구매한 고객만 출력하시오.
SELECT custid 고객번호, count(*) as 도서수량 from orders
where saleprice >= 8000
group by custid
HAVING count(*) >= 2
order by custid;


-------------------문제--------------------
--도서번호가 1인 도서의 이름
SELECT bookid, bookname from book
where bookid = 1;

--가격이 20000원 이상인 도서의 이름
SELECT bookname, price from book
where price >= 20000;

--박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
SELECT sum(saleprice) as "박지성의 총 구매액" from orders
where custid = 1;

--박지성이 구매한 도서의 수(박지성의 고객번호는 1번으로 놓고 작성)
SELECT count(*) from orders
where custid = 1;

--마당서점 도서의 총 개수
SELECT count(bookid) as "마당서점 도서 총 개수" from book;

--마당서점에 도서를 출고하는 출판사의 총 개수
SELECT count(distinct publisher) as "출판사 수" from book;

--모든 고객의 이름, 주소
SELECT name, address from customer;

--2014년 7월 4일 ~ 7월 7일 사이에 주문 받은 도서의 주문번호
SELECT BOOKID as 주문번호 FROM orders
WHERE orderdate BETWEEN '2014/07/04' AND '2014/07/07'
ORDER BY BOOKID;

--2014년 7월 4일 ~ 7월 7일 사이에 주문 받은 도서를 제외한 도서의 주문번호
SELECT DISTINCT BOOKID as 주문번호 FROM orders
WHERE orderdate NOT BETWEEN '2014/07/04' AND '2014/07/07'
ORDER BY BOOKID;

--성이 '김'씨인 고객의 이름과 주소
SELECT name, address from customer
where name like '김%';

--성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
SELECT name, address from customer
where name like '김_아';