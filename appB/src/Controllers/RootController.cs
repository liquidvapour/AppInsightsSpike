using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace AppA.Controllers
{
    [ApiController]
    [Route("/")]
    public class RootContoller : ControllerBase
    {
        private ILogger<RootContoller> _logger;

        public RootContoller(ILogger<RootContoller> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public string Get()
        {
            _logger.LogInformation("HelloWorld endpoint requested");
            return "Hello, World";
        }

    }
}