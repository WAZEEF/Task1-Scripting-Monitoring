# Linux Scripting & Monitoring Task

 This project is designed to showcase basic system diagnostics, scripting, health
 checking, and observability using Linux shell scripting, Python, Prometheus, and Docker.
 ##  Project Structure
 ```
 task1/
 system_report.sh
 health_check.py
 prometheus_exporter.py
 urls.txt
 requirements.txt
 Dockerfile
 logs/
 output/
 ```
 ## 1. Bash Script: `system_report.sh`
 **Description:**- Logs system metrics such as:
  - CPU and memory usage
  - Top 5 CPU-intensive processes
  - Disk usage on `/`, `/var`, `/home`
  - Network interfaces and IPs- Generates timestamped logs: `report_YYYY-MM-DD.log`- Deletes logs older than 14 days
 **Usage:**
 ```bash
 chmod +x system_report.sh
 ./system_report.sh
 ```
 ## 2. Python Script: `health_check.py`
 **Description:**- Pings URLs from `urls.txt`- Records HTTP status and latency- Logs into `output/health_log.json`
 **Usage:**
 ```bash
 python3 -m venv venv
 source venv/bin/activate
 pip install -r requirements.txt
 python health_check.py
 ```
 ## 3. Prometheus Exporter: `prometheus_exporter.py`
**Description:**- Exposes Prometheus metrics via `/metrics` on port 9100
  - `url_up`: 0 (down) or 1 (up)
  - `url_latency_seconds`: request time
 **Usage:**
 ```bash
 python prometheus_exporter.py
 ```
 ## 4. Dockerfile
 **Description:**- Containerizes the health check script for platform-independent execution
 **Usage:**
 ```bash
 docker build -t health-checker .
 docker run --rm health-checker
 ```
 ## 5. GitHub Repository
 All files, outputs, and instructions are version-controlled at:
 [https://github.com/WAZEEF/Task1-Scripting-Monitoring](https://github.com/WAZEEF/Task1-S
 cripting-Monitoring)
 ##  Requirements
 Install dependencies from the provided `requirements.txt`:
 ```bash
 pip install -r requirements.txt
 ```
 ##  Sample Output Logs- `logs/report_YYYY-MM-DD.log`- `output/health_log.json`
 ##  Interview Explanation
 > "This project covers system monitoring through Bash and Python scripting. I also
 converted it into a Prometheus exporter and containerized it using Docker, demonstrating
 practical DevOps skills in observability, automation, and cross-platform deployment.

