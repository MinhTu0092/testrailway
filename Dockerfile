# Base image Ubuntu mới nhất, nhẹ hơn nên dùng ubuntu:22.04
FROM ubuntu:22.04

# Cập nhật package và cài các tool cơ bản
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    vim \
    git \
    build-essential \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
    apt install -y software-properties-common wget curl git openssh-client tmate python3 && \
    apt clean

# Create a dummy index page to keep the service alive
RUN mkdir -p /app && echo "Tmate Session Running..." > /app/index.html
WORKDIR /app

# Expose a fake web port to trick Railway into keeping container alive
EXPOSE 6080

# Start a dummy Python web server to keep Railway service active
# and start tmate session
CMD python3 -m http.server 6080 & \
    tmate -F
