CREATE FUNCTION dbo.SubtractFromDepartment
(
    @amount1 Money,
    @amount2 Money
)
RETURNS Money
AS
BEGIN
    DECLARE @difference Money;

    SET @difference = @amount1 - @amount2;

    RETURN @difference;
END;