#!/bin/bash

# Build the Wasp project
cd wasp-core
wasp build
cd ..

# Build Docker image
docker build -t bookit -f Dockerfile.prod .