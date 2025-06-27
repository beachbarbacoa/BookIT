#!/bin/bash

# Build Docker image (includes building Wasp project)
docker build -t bookit -f Dockerfile.prod .