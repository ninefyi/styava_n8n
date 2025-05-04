FROM ubuntu:latest

# Install dependencies including Docker CE and Docker Compose Plugin
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    git \
 && mkdir -p /etc/apt/keyrings \
 && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
 && echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin \
 # Clean up apt cache
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Add application code
ADD ./app /app

# Set working directory
WORKDIR /app

# Expose ports (Note: These are informational; actual port forwarding is handled elsewhere, e.g., devcontainer.json or docker run/compose)
EXPOSE 8000
EXPOSE 35729
EXPOSE 3000
EXPOSE 1313
EXPOSE 5678
EXPOSE 1234