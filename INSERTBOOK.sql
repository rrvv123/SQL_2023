create or replace PROCEDURE INSERTBOOK(
    myBookId in number,
    myBookName in VARCHAR2,
    myPublisher in VARCHAR2,
    myPrice in number)
AS 
BEGIN
  insert into book(bookid, bookname, publisher, price)
  values (myBookId, myBookName, myPublisher, myPrice);
END; -- InsertBook ¾ÈÇØµµµÊ