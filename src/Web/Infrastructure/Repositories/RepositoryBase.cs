using System.Data;

namespace Web.Infrastructure;

public abstract class RepositoryBase
{
    protected readonly DapperContext _context;

    protected RepositoryBase(DapperContext context)
    {
        _context = context;
    }

    // Handy shortcut to open a connection
    protected IDbConnection CreateConnection()
        => _context.CreateConnection();
}
