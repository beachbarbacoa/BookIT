#!/bin/bash

# Build the Docker image
docker build -t bookit-test -f Dockerfile.prod .

# Run a temporary container to check Wasp installation
docker run --rm -it bookit-test /bin/bash -c "wasp version && which wasp && echo $PATH"

# Run another container to verify project structure
docker run --rm -it bookit-test /bin/bash -c "cd /app/wasp-core && ls -la && wasp build --verbose"