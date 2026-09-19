using System.Data;
using Dapper;
using HomeLibrary.Models;
using Microsoft.Data.SqlClient;

namespace HomeLibrary.Data;

public class BookRepository
{
    private readonly string _connectionString;

    public BookRepository(IConfiguration configuration)
    {
        _connectionString =
            configuration.GetConnectionString("DefaultConnection")!;
    }

    private SqlConnection CreateConnection()
    {
        return new SqlConnection(_connectionString);
    }

    public async Task<IEnumerable<Book>> GetListAsync(string? search)
    {
        await using var connection = CreateConnection();

        if (string.IsNullOrWhiteSpace(search))
        {
            return await connection.QueryAsync<Book>(
                "Books_GetList",
                commandType: CommandType.StoredProcedure);
        }

        return await connection.QueryAsync<Book>(
            "Books_Search",
            new { Search = search },
            commandType: CommandType.StoredProcedure);
    }

    public async Task<Book?> GetByIdAsync(int id)
    {
        await using var connection = CreateConnection();

        return await connection.QuerySingleOrDefaultAsync<Book>(
            "Books_GetById",
            new { Id = id },
            commandType: CommandType.StoredProcedure);
    }

    public async Task<int> InsertAsync(Book book)
    {
        await using var connection = CreateConnection();

        return await connection.QuerySingleAsync<int>(
            "Books_Insert",
            new
            {
                book.Title,
                book.Author,
                book.PublicationYear,
                book.Contents
            },
            commandType: CommandType.StoredProcedure);
    }

    public async Task UpdateAsync(Book book)
    {
        await using var connection = CreateConnection();

        await connection.ExecuteAsync(
            "Books_Update",
            new
            {
                book.Id,
                book.Title,
                book.Author,
                book.PublicationYear,
                book.Contents
            },
            commandType: CommandType.StoredProcedure);
    }

    public async Task DeleteAsync(int id)
    {
        await using var connection = CreateConnection();

        await connection.ExecuteAsync(
            "Books_Delete",
            new { Id = id },
            commandType: CommandType.StoredProcedure);
    }
}