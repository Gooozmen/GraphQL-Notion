using Web.Application;
using Web.Infrastructure;
using Web.GraphQL;

var builder = WebApplication.CreateBuilder(args);

// Dapper
builder.Services.AddScoped<DapperContext>();

// Repositories
builder.Services.AddTransient<IBookRepository, BookRepository>();
// builder.Services.AddScoped<IAuthorRepository, AuthorRepository>();
// builder.Services.AddScoped<IGenreRepository, GenreRepository>();
// builder.Services.AddScoped<IMemberRepository, MemberRepository>();
// builder.Services.AddScoped<ILoanRepository, LoanRepository>();

// GraphQL
builder.Services
    .AddGraphQLServer()
    .AddQueryType<Query>();

var app = builder.Build();
app.MapGraphQL();
app.Run();
