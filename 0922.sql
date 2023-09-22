-- abs(-15)
select abs(-15) from dual; -- 절대값 구하기

-- ceil(1.7)
select ceil(1.7) from dual; -- 올림

-- cos(3.14159)
select cos(3.14159) from dual; --코사인 값 구하기

-- floor(15.7)
select floor(15.7) from dual; -- 내림

-- log(10, 100)
select log(10, 100) from dual; -- 로그값 구하기 (루트)

-- mod(11, 4)
select mod(11, 4) from dual; -- 나머지 구하기

-- power(3, 2)
select power(3, 2) from dual; -- 제곱역할

-- round(15.7)
select round(15.7) from dual; -- 반올림

-- sign(-15)
select sign(-15) from dual; -- 숫자가 음수이면 -1 출력

-- trunc(15.7)
SELECT trunc(15.7) from dual; -- 소수점 이하 자리는 절삭함

-- chr(67)
select chr(67) from dual; -- 정수 아스키코드를 문자로 반환

-- concat('HAPPY', 'Birthday')
select concat('HAPPY', 'Birthday') from dual; -- 두 단어 연결

-- lower('Birthday')
select lower('Birthday') from dual; -- 대문자 > 소문자로 변환

-- lpad('Page 1', 15, '*.')
select lpad('Page 1', 15, '*.') from dual; -- 왼쪽부터 지정한 자릿수까지 지정한 문자로 채움

-- ltrim('Page 1', 'ae')
select ltrim('Page 1', 'ae') from dual; -- 대상 문자열의 왼쪽부터 지정한 문자 제거

-- replace('JACK', 'J', 'BL')
select replace('JACK', 'J', 'BL') from dual; -- 지정한 문자를 원하는 문자로 변경

-- rpad('Page 1', 15, '*.')
select rpad('Page 1', 15, '*.') from dual; -- 오른쪽부터 지정한 자릿수까지 지정한 문자로 채움

-- rtrim('Page 1', 'ae')
select rtrim('Page 1', 'ae') from dual; -- 대상 문자열의 오른쪽부터 지정한 문자 제거

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

-- next_day(sysdate, '화')
SELECT next_day(sysdate, '화') from dual;

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

-- 고객의 이름과 전화번호를 출력하시오. (단, 전화번호가 없는 고객은 연락처 없음으로 출력하시오.)
select name 이름, phone 전화번호 from customer;

select name 이름, nvl(phone, '연락처없음') 전화번호 from customer; -- 대체문자어

-- 고객목록에서 연번, 고객번호, 이름, 전화번호를 앞의 두명만 출력하시오.
SELECT rownum 순번, custid 고객번호, name 이름, phone 전화번호 from customer;

SELECT rownum 순번, custid 고객번호, name 이름, phone 전화번호 from customer
where rownum <= 2;

-- Mybook 테이블 생성하기
create table mybook(
    bookid number not null primary key,
    price number
);

-- 데이터 행 삽입
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

select * from mybook; -- mybook 테이블 값들 출력

select bookid, nvl(price, 0) from mybook; -- nvl 함수 이용하여 널값을 0으로 변환

select * from mybook
where price is null; -- 가격이 null인 값을 가진 행 출력

select * from mybook
where pirce = ''; -- null은 빈 공백이 아닌 아직 지정되지 않은 값이기 때문에 오류발생

select bookid, price + 100 from mybook; -- 가격에 +100 추가, 널값은 연산 안됨

select sum(price), avg(price), count(*) from mybook
where bookid >= 4; -- 애초에 bookid가 4 이상인 행이 없어서 널값 출력

select count(*), count(price) from mybook; -- 행 개수는 3개가 맞으나 가격을 가진 값은 둘 뿐이라 널값은 포함안돼서 출력

select sum(price), avg(price) from mybook; -- 널값을 제외한 가격들 연산

-- rownum에 관한 문제
select * from book; -- 전체 테이블 출력

select * from book -- 오름차순으로 5개의 행 출력
where rownum <= 5;

select * from book  -- 정렬 후 오름차순으로 5개의 행 출력
where rownum <= 5
order by price;

select * from (select * from book
                order by price)b
where rownum <= 5; -- 오름차순 정렬이 되어있는 테이블에서 다시 5개의 행 오름차순 출력(저렴한 가격순으로 출력)

select * from(select * from book -- 정렬 후 오름차순으로 5개의 행 출력
                where rownum <= 5)b
order by price;

select * from(select * from book -- 정렬 후 오름차순으로 5개의 행 출력
                where rownum <= 5
                order by price)b;
                
-- 평균판매금액 이하의 주문에 대해 주문번호와 금액을 출력
select avg(saleprice) from orders;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice <= (select avg(saleprice) from orders);

-- 각 고객의 평균판매금액보다 큰 금액의 주문 내역에 대해서만 주문번호, 고객번호, 판매금액을 출력하시오.
select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders mo -- mo라고 가상의 이름 지어줌 (main order의 약자)
where saleprice > (select avg(saleprice) from orders so                  -- 이것도 위와 같음   
                    where mo.custid = so.custid);

-- 총판매금액
select sum(saleprice) 총판매액 from orders;
-- 서울에 거주하는 사람의 고객번호
select custid from customer
where address like '%서울%';
-- 서울 거주자와 주소
select name, address from customer
where custid in(select custid from customer
                where address like '%서울%');
-- 대한민국에 거주하는 고객에게 판매한 도서의 총판매금액을 출력하시오.
select sum(saleprice) 총판매액 from orders
where custid in(select custid from customer
                where address like '%서울%');

-- 대한민국에 거주하지않는 고객에게 판매한 도서의 총판매금액을 출력하시오.
select sum(saleprice) 총판매액 from orders
where custid not in(select custid from customer
                where address like '%서울%');

-- 모든 주문번호, 금액
select orderid 주문번호, saleprice 금액 from orders;
-- 3번 고객의 주문한 금액
select saleprice from orders
where custid = 3;
-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력하시오.
select orderid 주문번호, saleprice 금액 from orders
where saleprice > all(select saleprice from orders
                        where custid = 3);

-- 서울에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오.(단, exists 연산자 사용)
select sum(saleprice) "총 판매금액" from orders o
where EXISTS(select * from customer c
                where address like '%서울%' and c.custid = o.custid);
                
-- 고객별 판매금액의 합계를 출력(고객번호, 판매합계)
select sum(saleprice) 판매합계, custid 고객번호 from orders
group by custid;
-- 고객별 판매금액의 합계를 출력(고객명, 판매합계)
select (select name from customer c
        where c.custid = o.custid) 이름, sum(saleprice) 판매합계 from orders o
group by o.custid;

-- 주문목록에 책이름을 저장할 수 있는 컬럼을 추가하시오.
alter table orders add bookname VARCHAR2(40);

update orders set bookname = (select bookname from book
                                where book.bookid = orders.bookid);
                                
-- 고객번호가 2 이하인 고객번호와 이름을 출력하시오.
select custid 고객번호, name 이름 from customer
where custid <= 2;

-- 고객번호가 2 이하인 고객의 판매금액을 출력하시오.(고객이름과 고객별 판매액 출력)
select name 이름, sum(saleprice) 판매총액
from (select custid, name from customer
        where custid <= 2) c, orders o
where c.custid = o.custid
group by c.name;

-- 연습문제
select custid, (select address from customer c -- 고객번호별로 주소와 판매금액 합계를 출력하는 sql문
                where c.custid = o.custid) 주소, sum(saleprice) 합계
from orders o
group by o.custid;