using Dapper;
using Web.Domain;
using Web.Application;

namespace Web.Infrastructure;

public class BookRepository(DapperContext context) : RepositoryBase(context), IBookRepository
{
    private const string GET_ALL_BOOKS = "SELECT * FROM books";
    
    private const string GET_BOOK_BY_ID = "SELECT * FROM books WHERE id = @Id";
    
    private const string INSERT_BOOK = @"INSERT INTO books (title, author_id, genre_id, published_year) " + 
                                       "VALUES (@Title, @AuthorId, @GenreId, @PublishedYear) RETURNING id;";
    
    private const string? UPDATE_BOOK = @"UPDATE books " + 
                                        "SET title=@Title, author_id=@AuthorId, genre_id=@GenreId, published_year=@PublishedYear " +
                                        "WHERE id=@Id";
    
    private const string DELETE_BOOK = @"DELETE FROM books WHERE id = @Id";

    public async Task<IEnumerable<Book>> GetAllAsync()
    {
        using var conn = CreateConnection();
        return await conn.QueryAsync<Book>(GET_ALL_BOOKS);
    }

    public async Task<Book?> GetByIdAsync(int id)
    {
        using var conn = CreateConnection();
        return await conn.QueryFirstOrDefaultAsync<Book>(GET_BOOK_BY_ID, new { Id = id });
    }

    public async Task<int> AddAsync(Book book)
    {
        using var conn = CreateConnection();
        return await conn.ExecuteScalarAsync<int>(INSERT_BOOK, book);
    }

    public async Task<bool> UpdateAsync(Book book)
    {

        using var conn = CreateConnection();
        var rows = await conn.ExecuteAsync(UPDATE_BOOK, book);
        return rows > 0;
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var conn = CreateConnection();
        var rows = await conn.ExecuteAsync(DELETE_BOOK, new { Id = id });
        return rows > 0;
    }
}
