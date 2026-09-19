using System.ComponentModel.DataAnnotations;

namespace HomeLibrary.Models;

public class Book
{
    public int Id { get; set; }

    [Required]
    [MaxLength(500)]
    public string Title { get; set; } = "";

    [Required]
    [MaxLength(300)]
    public string Author { get; set; } = "";

    [Range(0, 3000)]
    public short? PublicationYear { get; set; }

    public string? Contents { get; set; }

    public DateTime CreatedAt { get; set; }
}