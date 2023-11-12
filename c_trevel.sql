-- 테이블 생성하기
-- 관리자 테이블 작성
CREATE TABLE USERS (
    USERID NUMBER PRIMARY KEY,
    USERNAME VARCHAR2(50) UNIQUE,
    USER_ID VARCHAR2(100),
    PASSWORD VARCHAR2(100),
    IS_ADMIN NUMBER(1) DEFAULT 0
);
-- 사용자를 관리자로 설정하기
ALTER TABLE USERS
ADD (is_admin NUMBER(1) DEFAULT 0);


-- 여행지 테이블 작성
CREATE TABLE COUNTRY (
    COUNTRYID NUMBER PRIMARY KEY,
    COUNTRYNAME VARCHAR2(100),
    STAFF VARCHAR2(40),  -- 담장직원이름
    PRICE NUMBER(20)
);

-- 관광명소 테이블 작성
CREATE TABLE TOURIST_SPOT (
    SPOTID NUMBER PRIMARY KEY,
    SPOTNAME VARCHAR2(100),
    COUNTRYNAME VARCHAR2(100),
    PRICE NUMBER(20),
    COUNTRYID NUMBER
);

-- 맛집 테이블 작성
CREATE TABLE LOCAL_FOOD (
    FOODID NUMBER PRIMARY KEY,
    FOODNAME VARCHAR2(100),
    COUNTRYNAME VARCHAR2(100),
    PRICE NUMBER(20),
    COUNTRYID NUMBER  REFERENCES COUNTRY (COUNTRYID)
);

-- 기념품 테이블 작성
CREATE TABLE SOUVENIR (
    SOUVENIRID NUMBER PRIMARY KEY,
    SOUVENIRNAME VARCHAR2(40),
    COUNTRYNAME VARCHAR2(100),
    PRICE NUMBER(2),
    COUNTRYID NUMBER
);

-- 고객 테이블 작성
CREATE TABLE CUSTOMER (
    CUSTID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    ADDRESS VARCHAR2(50),
    PHONE VARCHAR2(20)
);

-- 주문 테이블 작성
CREATE TABLE ORDERS (
    ORDERID NUMBER PRIMARY KEY,
    CUSTID NUMBER REFERENCES CUSTOMER (CUSTID),
    COUNTRYID NUMBER REFERENCES COUNTRY (COUNTRYID),
    SALEPRICE NUMBER(20),
    ORDERDATE DATE
);

-- 각 테이블 수정 및 추가
-- 관광명소 테이블
ALTER TABLE TOURIST_SPOT
ADD CONSTRAINT fk_country
FOREIGN KEY (countryid) REFERENCES Country(countryid);
-- 기념품 테이블
ALTER TABLE SOUVENIR
ADD CONSTRAINT fk_country
FOREIGN KEY (countryid) REFERENCES Country(countryid);
ALTER TABLE SOUVENIR
MODIFY (SOUVENIRNAME VARCHAR2(100));

-- 영국여행을 주문한 사람 찾기
SELECT DISTINCT c.* FROM Customer c, Orders o -- 중복된 결과를 제거하고자 DISTINCT를 사용
WHERE c.custid = o.custid and o.countryid = 1;

SELECT c.* FROM Customer c -- 중복된 결과가 눈에 안보이는 데이터라면 JOIN을 사용한 방법으로도 가능
JOIN Orders o ON c.custid = o.custid
WHERE o.countryid = 1;