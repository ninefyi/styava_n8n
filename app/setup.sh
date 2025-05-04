# Assumes docker-compose.yaml is at the root /app root
# workspaceFolder is /app, no need to cd

# This setup script depends on running some code in other containers
echo "Starting Docker daemon..."
dockerd > /var/log/dockerd.log 2>&1 &

# Wait for Docker daemon to be ready
echo "Waiting for Docker daemon..."
while (! docker info > /dev/null 2>&1); do
  sleep 1
done
echo "Docker daemon is ready."

# Do whatever setup you need
echo "Running docker-compose up..."
docker-compose up -d

echo "Running setup commands..."
# docker-compose exec {some command to run migrations etc} # Add your specific setup command here if needed

echo "Setup script finished."
# Removed docker-compose stop to keep services running for postStartCommand or immediate use
# docker-compose stop