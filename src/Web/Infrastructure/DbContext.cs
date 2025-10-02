using System.Data;
using Npgsql;

namespace Web.Infrastructure;

public class DapperContext 
{
    private readonly IConfiguration _config;
    private IDbConnection? _connection;

    public DapperContext(IConfiguration config)
    {
        _config = config;
    }

    public IDbConnection CreateConnection()
    {
        if (_connection == null || _connection.State != ConnectionState.Open)
            _connection = new NpgsqlConnection(_config.GetConnectionString("DefaultConnection"));
        return _connection;
    }
    
}
