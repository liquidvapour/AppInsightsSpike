using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace AppA.Controllers
{
    [ApiController]
    [Route("/")]
    public class RootContoller : ControllerBase
    {
        private readonly IHttpClientFactory _clientFactory;
        private ILogger<RootContoller> _logger;


        public RootContoller(IHttpClientFactory clientFactory, ILogger<RootContoller> logger)
        {
            _clientFactory = clientFactory;
            _logger = logger;
        }

        [HttpGet]
        public async Task<string> Get()
        {
            _logger.LogInformation("HelloWorld endpoint requested");

            var client = _clientFactory.CreateClient();

            var response = await client.GetAsync("https://app-appbinsightsspike.azurewebsites.net/WeatherForecast");

            if (response.IsSuccessStatusCode) {
                var content = await response.Content.ReadAsStringAsync();
                return JsonConvert.DeserializeObject<List<Model>>(content);
            }

            return "Hello, World";
        }

    }
}