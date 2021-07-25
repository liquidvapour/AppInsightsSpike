using Microsoft.AspNetCore.Mvc;

namespace AppA.Controllers
{
    [ApiController]
    [Route("/")]
    public class RootContoller : ControllerBase
    {
        [HttpGet]
        public string Get()
        {
            return "Hello, World";
        }

    }
}