# Linux Scripting & Monitoring Task

This project includes:
- A system monitoring **Bash script**
- A **Python health checker** for URLs
- A **Prometheus exporter**
- Containerization via **Docker**

---

## 📁 Files

| File | Description |
|------|-------------|
| `system_report.sh` | Bash script to log system metrics |
| `health_check.py` | Pings URLs, logs latency and status |
| `exporter.py` | Prometheus exporter with `/metrics` |
| `urls.txt` | List of URLs to monitor |
| `requirements.txt` | Python dependencies |
| `Dockerfile` | To containerize health checker |
| `logs/` | Output log files |

---

## 🛠 How to Run

### Bash Script:
```bash
chmod +x system_report.sh
./system_report.sh

