# BookIT Deployment Guide

## Prerequisites
1. Install Wasp CLI: `curl -sSL https://get.wasp.sh/installer.sh | sh`
2. Add Wasp to PATH: `export PATH=$PATH:$HOME/.local/bin`
3. Install Docker

## Render Deployment
1. Push your code to GitHub
2. Create a new Web Service on Render:
   - Select "Node" environment
   - Build Command:
        ```
        curl -sSL https://get.wasp.sh/installer.sh | sh -s -- -v 0.16.6
        export PATH=$PATH:$HOME/.local/bin
        cd wasp-core
        wasp build
        cd ..
        npm install -g serve
        ```
   - Start Command: `serve -s wasp-core/.wasp/build -p $PORT`
   - Environment: production
   - Add environment variable: NODE_ENV=production
4. Set environment variables
5. Deploy

## Render Blueprint (Recommended)
1. Ensure `render.yaml` is in your repository
2. Go to Render Dashboard → New → Blueprint
3. Connect your GitHub repository
4. Click "Apply" to deploy both web service and database
2. Go to Render Dashboard → New → Blueprint
3. Connect your GitHub repository
4. Click "Apply" to deploy

## Post-Deployment
- Access your app at: `https://<your-service>.onrender.com`
- Test QR scanning: `https://quickchart.io/qr?text=https://<your-service>.onrender.com/business/test/reserve`

## Troubleshooting
- If build fails with "Couldn't find wasp project root":
  - Verify wasp-core/main.wasp exists in your repository
  - Check Render logs for project structure listing
- For other issues:
  - Check for syntax errors in main.wasp
  - Verify Wasp version compatibility
  - Check Render logs for errors