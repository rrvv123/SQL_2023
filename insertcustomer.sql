create or replace procedure insertcustomer(
    myCustId in number,
    myName in VARCHAR2,
    myAddress in VARCHAR2,
    myPhone in VARCHAR2)
AS 
BEGIN
  insert into customer(custid, name, address, phone)
  values (myCustId, myName, myAddress, myPhone);
END; -- InsertBook ���ص���

select * from customer;

exec insertcustomer(6, '�����', '���� ����', '000-2345-6789');
