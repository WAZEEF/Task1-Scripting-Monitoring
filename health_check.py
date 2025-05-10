import requests
import time
import json
from datetime import datetime, timezone

# Read URLs from file
with open("urls.txt", "r") as file:
    urls = [line.strip() for line in file.readlines() if line.strip()]

results = []

# Ping each URL
for url in urls:
    check = {
        "url": url,
        "timestamp": datetime.now(timezone.utc).isoformat()
    }
    try:
        start = time.time()
        response = requests.get(url, timeout=5)
        end = time.time()

        check["status_code"] = response.status_code
        check["latency"] = round(end - start, 3)
        check["success"] = response.ok

    except requests.RequestException as e:
        check["status_code"] = None
        check["latency"] = None
        check["success"] = False
        check["error"] = str(e)

    results.append(check)

# Save to JSON log
timestamp = datetime.now(timezone.utc).strftime("%Y-%m-%d_%H-%M-%S")
filename = f"logs/health_{timestamp}.json"
with open(filename, "w") as f:
    json.dump(results, f, indent=2)

print(f"Health check complete. Results saved to {filename}")

