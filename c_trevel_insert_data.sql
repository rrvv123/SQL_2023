-- ������ �α��ν�
INSERT INTO users (userId, userName, user_Id, password, is_admin)
VALUES (1, '��ȿ��', 'abc1', 'abc1', 1);

-- Country ���̺� ������ �߰��ϱ�
insert into Country VALUES(1, '����', '�����', 1900000); -- ��� ��� �ƴ϶� �ĺ�� Ƽ�ϰ� ������ ������. ������ ���Ұ��� ����
insert into Country VALUES(2, '�Ϻ�', '�۹���', 500000);
insert into Country VALUES(3, '�ɶ���', '�ڼ���', 1300000);
insert into Country VALUES(4, 'ȣ��', '������', 1400000);
-- insert into Country VALUES(5, '�Ͽ��� �����̴� ��', '�½�����', 8000); -- ������Ʈ�� �ִ� ����ܿ��� �߰��� �پ��� ���� �� �� �ִ� ��� �����ϰ����

-- Tourist_spot ���̺� ������ �߰��ϱ�
insert into Tourist_spot VALUES(1, '�����ڹ���', '����', 100000);
insert into Tourist_spot VALUES(2, '���� ����', '����', 60000);
insert into Tourist_spot VALUES(3, '�ݰ���', '�Ϻ�', 6000);
insert into Tourist_spot VALUES(4, '���̵����', '�Ϻ�', 20000);
insert into Tourist_spot VALUES(5, '���ο���', '�ɶ���', 35000);
insert into Tourist_spot VALUES(6, '��ŸŬ�ν� ����', '�ɶ���', 30000);
insert into Tourist_spot VALUES(7, '������Ͽ콺', 'ȣ��', 90000);
insert into Tourist_spot VALUES(8, '����', 'ȣ��', 16000);

-- Local_food ���̺� ������ �߰��ϱ�
insert into Local_food VALUES(1, 'Old Compton Brasserie', '����', 20000);
insert into Local_food VALUES(2, '�̽ø�����', '�Ϻ�', 80000);
insert into Local_food VALUES(3, 'Ekberg', '�ɶ���', 16000);
insert into Local_food VALUES(4, 'Grill Steak Seafood', 'ȣ��', 65000);

-- Souvenir ���̺� ������ �߰��ϱ�
insert into Souvenir VALUES(1, 'ĳ����� ���ݸ�', '����', 8900, 1);
insert into Souvenir VALUES(2, '�ظ����� ����������', '����', 128000, 1);
insert into Souvenir VALUES(3, '���̽� ���ݸ�', '�Ϻ�', 9000, 2);
insert into Souvenir VALUES(4, '����', '�Ϻ�' , 50000, 2);
insert into Souvenir VALUES(5, '���μ�', '�ɶ���', 24000, 3);
insert into Souvenir VALUES(6, 'Marimekko', '�ɶ���', 30000, 3);
insert into Souvenir VALUES(7, 'BLACKMORES omega3', 'ȣ��', 23000, 4);
insert into Souvenir VALUES(8, 'FLATOUTbear', 'ȣ��', 48000, 4);

-- customer ���̺� ������ �߰��ϱ�
insert into Customer VALUES(1, '����ȣ', '���� ��ü����', '000-1234-5678');
insert into Customer VALUES(2, '�����', '���� ����', '000-2234-5678');
insert into Customer VALUES(3, '���缮', '���ѹα� ����', '000-3234-5678');
insert into Customer VALUES(4, '�̿���', '�̱� Ŭ������', '000-4234-5678');
insert into Customer VALUES(5, 'Ź����', '���ѹα� ����', 'NULL');
insert into Customer VALUES(6, '�̰���', '������ �ĸ�', 'NULL');
insert into Customer VALUES(7, '�����', '���� ����', '000-5678-1234');
insert into Customer VALUES(8, '���缺', '���� ����', '000-6784-1232');

-- �߰��� �� ���̺� ���� �� �߰�
-- Tourist_spot ���̺� ������ ��ŷ�� ������ Ÿ�� �긮�� �߰�
insert into Tourist_spot VALUES(9, '��ŷ�� ����', '����', 25000, 1);
insert into Tourist_spot VALUES(10, 'Ÿ���긮��', '����', 18000, 1);

-- Tourist_spot ���̺� �Ϻ��� ���� ���� ������ ������ �� �߰�
insert into Tourist_spot VALUES(11, '���ڱ�������', '�Ϻ�', 12000, 2);
insert into Tourist_spot VALUES(12, '������ ��', '�Ϻ�', 30000, 2);

-- Local_food ���̺� ������ ������ �߰�
insert into Local_food VALUES(5, 'Nando''s', '����', 30000, 1);
insert into Local_food VALUES(6, 'Fish Plaice', '����', 25000, 1);

-- Local_food ���̺� �Ϻ��� ������ �߰�
insert into Local_food VALUES(7, '���͸��� ������', '�Ϻ�', 120000, 2);
insert into Local_food VALUES(8, 'ȿ����', '�Ϻ�', 90000, 2);

-- Local_food ���̺� �ɶ����� ������ �߰�
insert into Local_food VALUES(9, 'Forza', '�ɶ���', 20000, 3);
insert into Local_food VALUES(10, 'Harald', '�ɶ���', 30000, 3);

-- Local_food ���̺� ȣ���� ������ �߰�
INSERT INTO Local_food VALUES(11, 'Pancakes On the Rocks', 'ȣ��', 50000, 4);
INSERT INTO Local_food VALUES(12, 'Bourke Street Bakery', 'ȣ��', 45000, 4);

SELECT * from souvenir;

-- Orders ���̺� ������ �߰�
-- �ֹ� ID, �� ID, ���� ID, �Ǹ� ����, �ֹ����� �����Ͽ� ������ �߰�
INSERT INTO Orders VALUES(1, 1, 1, 1900000, TO_DATE('2023-11-12', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES(2, 2, 1, 1900000, TO_DATE('2023-11-13', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES(3, 3, 2, 500000, TO_DATE('2023-11-14', 'YYYY-MM-DD'));
INSERT INTO Orders VALUES(4, 4, 3, 1300000, TO_DATE('2023-11-15', 'YYYY-MM-DD'));
-- �ʿ信 ���� �߰����� �ֹ� �����͸� �߰�
