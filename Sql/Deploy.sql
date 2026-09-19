/*
  Из папки Sql:
    sqlcmd -S localhost -E -i Deploy.sql
*/
SET NOCOUNT ON;
SET XACT_ABORT ON;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;

PRINT N'=== HomeLibrary deploy: start ===';

:r .\00_CreateDatabase.sql
:r .\01_Schema.sql
:r .\02_StoredProcedures.sql
:r .\03_SeedData.sql

PRINT N'=== HomeLibrary deploy: finished ===';
GO
