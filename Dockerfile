FROM python:3.12-slim

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt && \
    apt update && apt install -y postgresql-client-15 && \
    rm -rf /var/lib/apt/lists/*

# Don't run as root
USER 1000

# Temporary entrypoint for testing
ENTRYPOINT ["bash"]
