
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'Bursary_Management_Application_DB')
BEGIN
    CREATE DATABASE Bursary_Managemeny_Application_DB;
END;
GO