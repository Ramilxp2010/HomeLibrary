USE HomeLibrary;
GO

PRINT N'=== HomeLibrary deploy: Start create schemas ===';

IF NOT EXISTS (
    SELECT 1 FROM sys.tables
    WHERE name = N'Books'
)
BEGIN
    CREATE TABLE Books
    (
        Id INT IDENTITY(1,1) PRIMARY KEY,

        Title NVARCHAR(500) NOT NULL,

        Author NVARCHAR(300) NOT NULL,

        PublicationYear SMALLINT NULL,

        Contents XML NULL,

        CreatedAt DATETIME2 NOT NULL
            DEFAULT SYSUTCDATETIME()
    );
    END

PRINT N'=== HomeLibrary deploy: End create schemas ===';

GO
