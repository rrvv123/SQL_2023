CREATE OR REPLACE PROCEDURE AVERAGEPRICE(
    averageVal OUT number
)
AS
BEGIN
  select avg(price) into averageVal from book
  where price is not null;
END AVERAGEPRICE;