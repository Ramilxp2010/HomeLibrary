using HomeLibrary.Data;
using HomeLibrary.Models;
using Microsoft.AspNetCore.Mvc;

namespace HomeLibrary.Controllers;

public class BooksController : Controller
{
    private readonly BookRepository _repository;

    public BooksController(BookRepository repository)
    {
        _repository = repository;
    }

    // GET /Books
    public async Task<IActionResult> Index(string? search)
    {
        var books = await _repository.GetListAsync(search);

        ViewBag.Search = search;

        return View(books);
    }

    // GET /Books/Details/5
    public async Task<IActionResult> Details(int id)
    {
        var book = await _repository.GetByIdAsync(id);

        if (book == null)
            return NotFound();

        return View(book);
    }

    // GET /Books/Create
    public IActionResult Create()
    {
        return View(new Book
        {
            Contents = """
                <contents>
                  <chapter number="1">
                    <title>Новая глава</title>
                  </chapter>
                </contents>
                """
        });
    }

    // POST /Books/Create
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create(Book book)
    {
        if (!ModelState.IsValid)
            return View(book);

        if (!IsValidXml(book.Contents))
        {
            ModelState.AddModelError(
                nameof(book.Contents),
                "Оглавление содержит некорректный XML.");

            return View(book);
        }

        var id = await _repository.InsertAsync(book);

        return RedirectToAction(nameof(Details), new { id });
    }

    // GET /Books/Edit/5
    public async Task<IActionResult> Edit(int id)
    {
        var book = await _repository.GetByIdAsync(id);

        if (book == null)
            return NotFound();

        return View(book);
    }

    // POST /Books/Edit/5
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(int id, Book book)
    {
        if (id != book.Id)
            return BadRequest();

        if (!ModelState.IsValid)
            return View(book);

        if (!IsValidXml(book.Contents))
        {
            ModelState.AddModelError(
                nameof(book.Contents),
                "Оглавление содержит некорректный XML.");

            return View(book);
        }

        await _repository.UpdateAsync(book);

        return RedirectToAction(nameof(Details), new { id });
    }

    // POST /Books/Delete/5
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Delete(int id)
    {
        await _repository.DeleteAsync(id);

        return RedirectToAction(nameof(Index));
    }

    private static bool IsValidXml(string? xml)
    {
        if (string.IsNullOrWhiteSpace(xml))
            return true;

        try
        {
            System.Xml.Linq.XDocument.Parse(xml);
            return true;
        }
        catch
        {
            return false;
        }
    }
}