create TABLE Book (
    bookid NUMBER(2) PRIMARY KEY,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(20)
);

-- 수입도서정보 Imported_Book 테이블
create TABLE Imported_Book (
    bookid NUMBER(2) PRIMARY KEY,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(20)
);

-- 고객정보 customer 테이블
create TABLE Customer (
    custid NUMBER(2) PRIMARY KEY,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(20)
);

-- 주문정보 Orders 테이블
create TABLE Orders (
    orderid NUMBER(2) PRIMARY KEY,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8),
    orderdate DATE
);

--Book 테이블에 10권의 도서 정보를 추가하세요
insert into Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
insert into Book VALUES(2, '손웅정 이야기', '월드클래스', 13000);
insert into Book VALUES(3, '바나나차차', '핑크퐁', 22000);
insert into Book VALUES(4, '뽀로로와 친구들', '대한미디어', 35000);
insert into Book VALUES(5, '하울의 움직이는 성', '굿스포츠', 8000);
insert into Book VALUES(6, '해리포터', '굿스포츠', 6000);
insert into Book VALUES(7, '개미', '이상미디어', 20000);
insert into Book VALUES(8, '파피용', '이상미디어', 13000);
insert into Book VALUES(9, '조선왕조실록', '세계사', 7500);
insert into Book VALUES(10, 'Olmpic Champions', 'Pearson', 13000);

insert into Customer VALUES(1, '박지성', '영국 맨체스터', '000-1234-5678');
insert into Customer VALUES(2, '손흥민', '영국 런던', '000-2234-5678');
insert into Customer VALUES(3, '김연아', '대한민국 서울', '000-3234-5678');
insert into Customer VALUES(4, '추신수', '미국 클리블랜드', '000-4234-5678');
insert into Customer VALUES(5, '박세리', '대한민국 대전', 'NULL');

insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));
insert into Orders VALUES(1, 1, 1, 6000, T0_DATE('2023-08-15', 'yyyy-mm-dd'));