using Microsoft.AspNetCore.Mvc;
using Tour_Management_Core.Models;

namespace Tour_Management_Core.Controllers
{
    public class HomeController : Controller
    {
        private readonly TourDbContext _context;

        public HomeController(TourDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            // Seed sample data if DB is empty
            if (!_context.Tours.Any())
            {
                _context.Tours.AddRange(
                    new Tour { Name = "Beach Trip", Location = "Goa", Price = 200 },
                    new Tour { Name = "Mountain Trek", Location = "Himalayas", Price = 500 }
                );
                _context.SaveChanges();
            }

            var tours = _context.Tours.ToList();
            return View(tours);
        }
    }
}
