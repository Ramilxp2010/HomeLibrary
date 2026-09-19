SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

PRINT N'=== HomeLibrary deploy: Start create procedures ===';

USE HomeLibrary;
GO

CREATE PROCEDURE Books_GetList
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        Id,
        Title,
        Author,
        PublicationYear
    FROM Books
    ORDER BY Title;
END
GO

CREATE PROCEDURE Books_GetById
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        Id,
        Title,
        Author,
        PublicationYear,
        Contents,
        CreatedAt
    FROM Books
    WHERE Id = @Id;
END
GO

CREATE PROCEDURE Books_Insert
    @Title NVARCHAR(500),
    @Author NVARCHAR(300),
    @PublicationYear SMALLINT = NULL,
    @Contents XML = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Books
    (
        Title,
        Author,
        PublicationYear,
        Contents
    )
    VALUES
    (
        @Title,
        @Author,
        @PublicationYear,
        @Contents
    );

    SELECT CAST(SCOPE_IDENTITY() AS INT);
END
GO

CREATE PROCEDURE Books_Update
    @Id INT,
    @Title NVARCHAR(500),
    @Author NVARCHAR(300),
    @PublicationYear SMALLINT = NULL,
    @Contents XML = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Books
    SET
        Title = @Title,
        Author = @Author,
        PublicationYear = @PublicationYear,
        Contents = @Contents
    WHERE Id = @Id;
END
GO

CREATE PROCEDURE Books_Search
    @Search NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        Id,
        Title,
        Author,
        PublicationYear
    FROM Books
    WHERE
        Title LIKE N'%' + @Search + N'%'
        OR Author LIKE N'%' + @Search + N'%'
        OR Contents.exist(
            '//*[contains(text()[1], sql:variable("@Search"))]'
        ) = 1
    ORDER BY Title;
END
GO

PRINT N'=== HomeLibrary deploy: End create procedures ===';