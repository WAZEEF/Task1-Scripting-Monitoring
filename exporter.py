import time
import requests
from prometheus_client import start_http_server, Gauge
from datetime import datetime, timezone

# Define Prometheus metrics
LATENCY_GAUGE = Gauge('url_latency_seconds', 'Latency of URL in seconds', ['url'])
UP_GAUGE = Gauge('url_up', 'URL availability (1 = up, 0 = down)', ['url'])

# Load URLs from urls.txt
def load_urls():
    with open("urls.txt") as f:
        return [line.strip() for line in f if line.strip()]

def check_urls():
    urls = load_urls()
    for url in urls:
        try:
            start = time.time()
            response = requests.get(url, timeout=5)
            latency = round(time.time() - start, 3)

            LATENCY_GAUGE.labels(url=url).set(latency)
            UP_GAUGE.labels(url=url).set(1 if response.ok else 0)

        except requests.RequestException:
            LATENCY_GAUGE.labels(url=url).set(0)
            UP_GAUGE.labels(url=url).set(0)

if __name__ == "__main__":
    print("Starting Prometheus Exporter on http://localhost:9100/metrics")
    start_http_server(9100)

    while True:
        check_urls()
        time.sleep(30)  # scrape interval

