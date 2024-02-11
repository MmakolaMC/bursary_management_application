CREATE PROCEDURE UpdateBudgetAmount
AS
BEGIN 

    UPDATE b
    SET b.BudgetAmount = b.BudgetAmount - ISNULL(f.TotalAmountFunded, 0)
    FROM dbo.Budget AS b
    LEFT JOIN (
        SELECT BudgetID, SUM(AmountFunded) AS TotalAmountFunded
        FROM dbo.Funds
        GROUP BY BudgetID
    ) AS f ON b.BudgetID = f.BudgetID;
END


EXEC UpdateBudgetAmount;

SELECT * FROM dbo.Budget;