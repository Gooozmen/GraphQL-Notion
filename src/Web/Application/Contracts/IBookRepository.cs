using Web.Domain;

namespace Web.Application;

public interface IBookRepository
{
    Task<IEnumerable<Book>> GetAllAsync();
    Task<Book?> GetByIdAsync(int id);
    Task<int> AddAsync(Book book);
    Task<bool> UpdateAsync(Book book);
    Task<bool> DeleteAsync(int id);
}
