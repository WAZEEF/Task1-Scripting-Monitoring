FROM python:3.12-slim

# Create app directory
WORKDIR /app

# Copy files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose metrics port
EXPOSE 9100

# Run Prometheus Exporter
CMD ["python", "exporter.py"]

