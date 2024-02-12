CREATE PROCEDURE DistributeFunds
AS
BEGIN
    DECLARE @TotalAmount INT
    DECLARE @AmountFunded INT

    -- BudgetAmount is the total amount BBD allocates for the year 
    SELECT @TotalAmount = BudgetAmount FROM Budget


    -- AmountFunded is the money allocated to the institution
    SELECT @AmountFunded = AmountFunded FROM Funds

    -- Check if the Total amount is enough to fund an institution 
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
 
 
EXEC DistributeFunds;
 
