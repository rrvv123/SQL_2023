-- 사용자 정의 함수
create or replace function fnc_interest (price number)
                                            return int
is
    myInterest number;
begin
    if price >= 30000 then
        myInterest := price * 0.1;
    else
        myInterest := price * 0.05;
    end if;
    return myInterest;
end;

-- 실행할 때 블록설정하고 실행해 주셈.
SELECT custid, orderid, saleprice, fnc_interest(saleprice) 이익금 from orders;