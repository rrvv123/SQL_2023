-- 관리자 로그인시
INSERT INTO users (userId, userName, user_Id, password, is_admin)
VALUES (1, '박효제', 'abc1', 'abc1', 1);

-- Country 테이블에 정보를 추가하기
insert into Country VALUES(1, '영국', '손흥민', 1900000); -- 모든 경비가 아니라 식비와 티켓값 제외한 가격임. 비행기와 숙소값만 포함
insert into Country VALUES(2, '일본', '송범근', 500000);
insert into Country VALUES(3, '핀란드', '박세리', 1300000);
insert into Country VALUES(4, '호주', '박지성', 1400000);
-- insert into Country VALUES(5, '하울의 움직이는 성', '굿스포츠', 8000); -- 웹사이트에 있는 나라외에도 추가로 다양한 나라 볼 수 있는 기능 설정하고싶음

-- Tourist_spot 테이블에 정보를 추가하기
insert into Tourist_spot VALUES(1, '영국박물관', '영국', 100000);
insert into Tourist_spot VALUES(2, '런던 아이', '영국', 60000);
insert into Tourist_spot VALUES(3, '금각사', '일본', 6000);
insert into Tourist_spot VALUES(4, '기요미데즈라', '일본', 20000);
insert into Tourist_spot VALUES(5, '무민월드', '핀란드', 35000);
insert into Tourist_spot VALUES(6, '산타클로스 마을', '핀란드', 30000);
insert into Tourist_spot VALUES(7, '오페라하우스', '호주', 90000);
insert into Tourist_spot VALUES(8, '울루루', '호주', 16000);

-- Local_food 테이블에 정보를 추가하기
insert into Local_food VALUES(1, 'Old Compton Brasserie', '영국', 20000);
insert into Local_food VALUES(2, '미시마테이', '일본', 80000);
insert into Local_food VALUES(3, 'Ekberg', '핀란드', 16000);
insert into Local_food VALUES(4, 'Grill Steak Seafood', '호주', 65000);

-- Souvenir 테이블에 정보를 추가하기
insert into Souvenir VALUES(1, '캐드버리 초콜릿', '영국', 8900, 1);
insert into Souvenir VALUES(2, '해리포터 마법지팡이', '영국', 128000, 1);
insert into Souvenir VALUES(3, '로이스 초콜릿', '일본', 9000, 2);
insert into Souvenir VALUES(4, '사케', '일본' , 50000, 2);
insert into Souvenir VALUES(5, '무민샵', '핀란드', 24000, 3);
insert into Souvenir VALUES(6, 'Marimekko', '핀란드', 30000, 3);
insert into Souvenir VALUES(7, 'BLACKMORES omega3', '호주', 23000, 4);
insert into Souvenir VALUES(8, 'FLATOUTbear', '호주', 48000, 4);

-- customer 테이블에 정보를 추가하기
insert into Customer VALUES(1, '박찬호', '영국 맨체스터', '000-1234-5678');
insert into Customer VALUES(2, '김수로', '영국 런던', '000-2234-5678');
insert into Customer VALUES(3, '유재석', '대한민국 서울', '000-3234-5678');
insert into Customer VALUES(4, '이용진', '미국 클리블랜드', '000-4234-5678');
insert into Customer VALUES(5, '탁재훈', '대한민국 대전', 'NULL');
insert into Customer VALUES(6, '이강인', '프랑스 파리', 'NULL');
insert into Customer VALUES(7, '김민재', '독일 뮌헨', '000-5678-1234');
insert into Customer VALUES(8, '이재성', '독일 뮌헨', '000-6784-1232');

-- 추가로 각 테이블에 정보 더 추가
-- Tourist_spot 테이블에 영국의 버킹엄 궁전과 타워 브리지 추가
insert into Tourist_spot VALUES(9, '버킹엄 궁전', '영국', 25000, 1);
insert into Tourist_spot VALUES(10, '타워브리지', '영국', 18000, 1);

-- Tourist_spot 테이블에 일본의 닛코 국립 공원과 히메지 성 추가
insert into Tourist_spot VALUES(11, '닛코국립공원', '일본', 12000, 2);
insert into Tourist_spot VALUES(12, '히메지 성', '일본', 30000, 2);

-- Local_food 테이블에 영국의 음식점 추가
insert into Local_food VALUES(5, 'Nando''s', '영국', 30000, 1);
insert into Local_food VALUES(6, 'Fish Plaice', '영국', 25000, 1);

-- Local_food 테이블에 일본의 음식점 추가
insert into Local_food VALUES(7, '오와리야 시조텐', '일본', 120000, 2);
insert into Local_food VALUES(8, '효테이', '일본', 90000, 2);

-- Local_food 테이블에 핀란드의 음식점 추가
insert into Local_food VALUES(9, 'Forza', '핀란드', 20000, 3);
insert into Local_food VALUES(10, 'Harald', '핀란드', 30000, 3);

-- Local_food 테이블에 호주의 음식점 추가
INSERT INTO Local_food VALUES(11, 'Pancakes On the Rocks', '호주', 50000, 4);
INSERT INTO Local_food VALUES(12, 'Bourke Street Bakery', '호주', 45000, 4);

SELECT * from souvenir;

-- Orders 테이블에 데이터 추가
-- 주문 ID, 고객 ID, 나라 ID, 판매 가격, 주문일을 지정하여 데이터 추가
INSERT INTO Orders VALUES(1, 1, 1, 1900000, TO_DATE('2023-11-12', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES(2, 2, 1, 1900000, TO_DATE('2023-11-13', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES(3, 3, 2, 500000, TO_DATE('2023-11-14', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES(4, 4, 3, 1300000, TO_DATE('2023-11-15', 'YYYY-MM-DD'));
-- 필요에 따라 추가적인 주문 데이터를 추가
