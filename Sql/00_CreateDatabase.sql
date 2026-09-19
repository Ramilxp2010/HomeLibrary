USE master;
GO

PRINT N'=== Dropping database HomeLibrary if exists ===';

IF DB_ID(N'HomeLibrary') IS NOT NULL
BEGIN
    ALTER DATABASE HomeLibrary
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    DROP DATABASE HomeLibrary;

    PRINT N'Database HomeLibrary dropped.';
END
ELSE
BEGIN
    PRINT N'Database HomeLibrary does not exist.';
END
GO


PRINT N'=== Creating database HomeLibrary ===';

CREATE DATABASE HomeLibrary;
GO


PRINT N'Database HomeLibrary created.';
GO


USE HomeLibrary;
GO