# BookIT Deployment Guide

## Prerequisites
1. Install Wasp CLI: `curl -sSL https://get.wasp.sh/installer.sh | sh`
2. Add Wasp to PATH: `export PATH=$PATH:$HOME/.local/bin`
3. Install Docker

## Local Build & Run
```bash
# Build the project
chmod +x build.sh
./build.sh

# Run the Docker container
docker run -p 3000:3000 bookit
```

## Render Deployment
1. Push your code to GitHub
2. Create a new Web Service on Render
3. Configure:
   - Build Command: `chmod +x build.sh && ./build.sh`
   - Start Command: `node build/server.js`
   - Environment: production
4. Set environment variables
5. Deploy

## Render Blueprint (Alternative)
1. Ensure these files are in your repository:
   - `render.yaml`
   - `Dockerfile.prod`
   - `build.sh`
2. Go to Render Dashboard → New → Blueprint
3. Connect your GitHub repository
4. Click "Apply" to deploy

## Post-Deployment
- Access your app at: `https://<your-service>.onrender.com`
- Test QR scanning: `https://quickchart.io/qr?text=https://<your-service>.onrender.com/business/test/reserve`

## Troubleshooting
- If build fails, check Wasp installation
- Verify Docker has enough resources (2GB RAM recommended)
- Check Render logs for errors