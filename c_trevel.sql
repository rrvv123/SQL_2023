-- ���̺� �����ϱ�
-- ������ ���̺� �ۼ�
CREATE TABLE USERS (
    USERID NUMBER PRIMARY KEY,
    USERNAME VARCHAR2(50) UNIQUE,
    USER_ID VARCHAR2(100),
    PASSWORD VARCHAR2(100),
    IS_ADMIN NUMBER(1) DEFAULT 0
);
-- ����ڸ� �����ڷ� �����ϱ�
ALTER TABLE USERS
ADD (is_admin NUMBER(1) DEFAULT 0);


-- ������ ���̺� �ۼ�
CREATE TABLE COUNTRY (
    COUNTRYID NUMBER PRIMARY KEY,
    COUNTRYNAME VARCHAR2(100),
    STAFF VARCHAR2(40),  -- ���������̸�
    PRICE NUMBER(20)
);

-- ������� ���̺� �ۼ�
CREATE TABLE TOURIST_SPOT (
    SPOTID NUMBER PRIMARY KEY,
    SPOTNAME VARCHAR2(100),
    COUNTRYNAME VARCHAR2(100),
    PRICE NUMBER(20),
    COUNTRYID NUMBER
);

-- ���� ���̺� �ۼ�
CREATE TABLE LOCAL_FOOD (
    FOODID NUMBER PRIMARY KEY,
    FOODNAME VARCHAR2(100),
    COUNTRYNAME VARCHAR2(100),
    PRICE NUMBER(20),
    COUNTRYID NUMBER  REFERENCES COUNTRY (COUNTRYID)
);

-- ���ǰ ���̺� �ۼ�
CREATE TABLE SOUVENIR (
    SOUVENIRID NUMBER PRIMARY KEY,
    SOUVENIRNAME VARCHAR2(40),
    COUNTRYNAME VARCHAR2(100),
    PRICE NUMBER(2),
    COUNTRYID NUMBER
);

-- �� ���̺� �ۼ�
CREATE TABLE CUSTOMER (
    CUSTID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    ADDRESS VARCHAR2(50),
    PHONE VARCHAR2(20)
);

-- �ֹ� ���̺� �ۼ�
CREATE TABLE ORDERS (
    ORDERID NUMBER PRIMARY KEY,
    CUSTID NUMBER REFERENCES CUSTOMER (CUSTID),
    COUNTRYID NUMBER REFERENCES COUNTRY (COUNTRYID),
    SALEPRICE NUMBER(20),
    ORDERDATE DATE
);

-- �� ���̺� ���� �� �߰�
-- ������� ���̺�
ALTER TABLE TOURIST_SPOT
ADD CONSTRAINT fk_country
FOREIGN KEY (countryid) REFERENCES Country(countryid);
-- ���ǰ ���̺�
ALTER TABLE SOUVENIR
ADD CONSTRAINT fk_country
FOREIGN KEY (countryid) REFERENCES Country(countryid);
ALTER TABLE SOUVENIR
MODIFY (SOUVENIRNAME VARCHAR2(100));

-- ���������� �ֹ��� ��� ã��
SELECT DISTINCT c.* FROM Customer c, Orders o -- �ߺ��� ����� �����ϰ��� DISTINCT�� ���
WHERE c.custid = o.custid and o.countryid = 1;

SELECT c.* FROM Customer c -- �ߺ��� ����� ���� �Ⱥ��̴� �����Ͷ�� JOIN�� ����� ������ε� ����
JOIN Orders o ON c.custid = o.custid
WHERE o.countryid = 1;