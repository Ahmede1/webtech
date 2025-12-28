# Use a small Python base
FROM python:3.9-slim

# Prevent Python from writing .pyc, and make logs unbuffered
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# System deps (add more if your project needs them)
# - ca-certificates: TLS
# - curl: optional debugging
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the whole repository into the image
COPY . /app

# Install your local wappalyzer package + extras
# Assumes /app/wappalyzer is a Python package with setup.py/pyproject.toml
RUN pip install --no-cache-dir -U pip \
 && pip install --no-cache-dir /app/wappalyzer \
 && pip install --no-cache-dir colorama

# Install the CLI into PATH
# (Assumes the file exists at /app/wappalyzer/techget as in your install.sh)
RUN cp /app/wappalyzer/techget /usr/local/bin/techget \
 && chmod +x /usr/local/bin/techget

# Default command: run techget
ENTRYPOINT ["techget"]
CMD ["-h"]
