create or replace trigger afterinsertbook
after insert on book for each row
declare
    average number;
begin
    insert into book_log
        values (:new.bookid, :new.bookname, :new.publisher, :new.price);
    dbms_output.put_line('삽입행을 book_log테이블에 백업했습니다...');
end;

insert into book values(17, '과학은 과학이다', '관상미디어', 25000);

select * from book where bookid = 17;

select * from book_log where bookid_l = 17;