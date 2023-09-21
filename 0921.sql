-- 1번 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
-- (박지성이 구매한 도서의 출판사이름을 출력하시오.)
select publisher from customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid = bs.bookid
and name = '박지성'; -- name like '박지성' 해도됨

SELECT name from customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid = bs.bookid
and name not like '박지성'
and publisher in(select publisher from customer cs, orders os, book bs
                where cs.custid = os.custid and os.bookid = bs.bookid
                and name = '박지성');

-- 2번 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
SELECT name from customer cs
where (select count(DISTINCT publisher) from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid and name like cs.name) >= 2;

-- 3번 전체 고객의 30% 이상이 구매한 도서이름 출력
SELECT bookname from book b
where (select count(bk.bookid) from orders o, book bk
        where bK.bookid = o.bookid and bk.bookid = b.bookid) >= (select count(*) from customer)*0.3;

-- 새로운 도서 ('스포츠 세계', '대한미디어', 10000원)이 마당서점에 입고되었다.
-- 삽입이 안될 경우 필요한 데이터가 더 있는지 찾아보자
insert into book
values(9, '스포츠 세계', '대한미디어', 10000);

-- '세계사'에서 출판한 도서를 삭제해야 한다
DELETE from book
where publisher = '세계사';

select * from book;

-- '이상미디어'에서 출판한 도서를 삭제해야 한다. 삭제가 안될 경우 원인을 생각해보자
DELETE from book
where publisher = '이상미디어'; -- 무결성 제약조건이 위배되어서, 이미 부모 자식 관계인 테이블
--  따라서 해당 출판사의 도서정보는 삭제불가.

-- 출판사 '대한미디어'가 '대한출판사'로 이름을 바꾸었다.
UPDATE book
set publisher = '대한출판사'
where publisher = '대한미디어';

--------------------------내장함수-----------------------------------------
-- abs: 절대값 구하는 함수
SELECT abs(-33), abs(+33) "절대값" from dual; -- dual은 일시적으로 사용하는 가상의 테이블을 이용함

-- 5.657을 소수 첫째자리까지 반올림한 값을 구하시오.
SELECT round(5.657, 1) from dual;

-- 고객별 평균 주문금액을 백원단위로 반올림한 값을 구하시오.
SELECT custid "고객번호", round(avg(saleprice), -2) "평균금액" from orders
group by custid;

-- 도서명에 '과학'이 포함된 도서를 '수학'으로 변경하여 출력하시오.
-- 실제 book테이블의 원본데이터를 변경하면 안된다.
SELECT bookid, replace(bookname, '과학', '수학') bookname, publisher, price from book;
select * from book;

-- '굿스포츠'에서 출판한 도서의 제목과 제목의 글자 수, 바이트 수를 출력하시오.
SELECT bookname "도서명", length(bookname) "글자 수", lengthb(bookname) "바이트 수" from book
where publisher = '굿스포츠';

-- 고객중에서 같은 성씨를 가진 사람이 몇명인지 성씨별로 인원수를 출력하시오.
select substr(name, 1, 1) "성", count(*) "인원 수" from customer
group by substr(name, 1, 1);

-- 서점의 주문확정일은 주문일로부터 10일 후이다. 주문번호, 주문일, 주문확정일을 출력하시오.
SELECT orderid 주문번호, orderdate 주문일, orderdate+10 주문확정일 from orders
order by orderid;

-- 2023년 8월 28일에 주문받은 주문번호, 주문일, 고객번호, 도서번호를 모두 출력하시오.
-- 단, '주문일은 yyyy-m-m-dd 일'과 같은 format으로 표시하시오.
SELECT orderid 주문번호, to_char(orderdate, 'yyyy-mm-dd') 주문일, name 고객번호, bookname 도서번호 from orders, customer, book
where orderdate = to_date('20230828', 'yyyymmdd');

-- 2023년 8월 28일에 주문받은 주문번호, 주문일, 고객명, 도서명을 모두 출력하시오.
-- 단, '주문일은 yyyy-mm-dd 일'과 같은 format으로 표시하시오.
SELECT orderid 주문번호, to_char(orderdate, 'yyyy-mm-dd') 주문일, name 고객명, bookname 도서명 from orders o, customer c, book b
where o.bookid = b.bookid and o.custid = c.custid
and orderdate = to_date('20230828', 'yyyymmdd'); -- 부모 자식간의 관계 잘 생각해서 조건부여 해주기

-- DB 서버의 설정된 날짜와 시간 요일을 출력하시오.
-- 실제 반환된 날짜와 형식을 지정한(년도 4자리/월 2자리/ 날짜 2자리 간략한 요일 시:분:초) 날짜와 시간 2가지를 출력하시오.
select sysdate, to_char(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1" from dual;