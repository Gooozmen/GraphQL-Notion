namespace Web.Domain;

public class Author
{
    public int Id { get; set; }
    public string Name { get; set; } = "";
    public string? Country { get; set; }
}

public class Genre
{
    public int Id { get; set; }
    public string Name { get; set; } = "";
}

public class Book
{
    public int Id { get; set; }
    public string Title { get; set; } = "";
    public int AuthorId { get; set; }
    public int GenreId { get; set; }
    public int PublishedYear { get; set; }
}

public class Member
{
    public int Id { get; set; }
    public string Name { get; set; } = "";
    public string Email { get; set; } = "";
    public DateTime JoinedDate { get; set; }
}

public class Loan
{
    public int Id { get; set; }
    public int BookId { get; set; }
    public int MemberId { get; set; }
    public DateTime LoanDate { get; set; }
    public DateTime? ReturnDate { get; set; }
}

