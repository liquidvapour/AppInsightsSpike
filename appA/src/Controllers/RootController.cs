using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;

namespace AppA.Controllers
{
    public class WeatherOptions
    {
        public static readonly string Weather = "Weather";
        public string Url {get; set;}
    }

    [ApiController]
    [Route("/")]
    public class RootContoller : ControllerBase
    {
        private readonly IHttpClientFactory _clientFactory;
        private ILogger<RootContoller> _logger;
        private WeatherOptions _siteRoot;

        public RootContoller(
            IHttpClientFactory clientFactory, 
            IOptions<WeatherOptions> weatherSettings,
            ILogger<RootContoller> logger)
        {
            _clientFactory = clientFactory;
            _logger = logger;
            _siteRoot = weatherSettings.Value;
        }

        [HttpGet]
        public async Task<IReadOnlyCollection<Model>> Get()
        {
            _logger.LogInformation("HelloWorld endpoint requested");

            var client = _clientFactory.CreateClient();

            var response = await client.GetAsync($"{_siteRoot.Url}/WeatherForecast");

            if (response.IsSuccessStatusCode) {
                var content = await response.Content.ReadAsStringAsync();
                return JsonConvert.DeserializeObject<List<Model>>(content);
            }

            return new Model[0];
        }

    }
}