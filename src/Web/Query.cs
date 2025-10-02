using Web.Domain;
using Web.Application;

namespace Web.GraphQL;

public class Query
{
    public async Task<IEnumerable<Book>> GetBooks([Service] IBookRepository repo) 
        => await repo.GetAllAsync();

    // public async Task<Book?> GetBookById(int id, [Service] IBookRepository repo) 
    //     => await repo.GetByIdAsync(id);
    //
    // public async Task<IEnumerable<Author>> GetAuthors([Service] IAuthorRepository repo) 
    //     => await repo.GetAllAsync();
}