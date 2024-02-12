CREATE PROCEDURE DistributeFundsz
AS
BEGIN
    DECLARE @TotalAmount INT
    DECLARE @AmountFunded INT
 
 
    SELECT @TotalAmount = BudgetAmount FROM Budget
 
   
    SELECT @AmountFunded = AmountFunded FROM Funds
 
   
    IF @TotalAmount >= @AmountFunded
    BEGIN
       
        UPDATE Budget
        SET BudgetAmount = BudgetAmount - @AmountFunded
    END
    ELSE
    BEGIN
       
        RAISERROR('Insufficient funds', 16, 1);
        RETURN;
    END
END
 
 
EXEC DistributeFundsz;
 
SELECT BudgetAmount FROM dbo.Budget ;