# BookIT Deployment Guide (Docker-based)

## Prerequisites
1. Docker installed on your local machine (for testing)
2. Render.com account
3. GitHub repository with BookIT code

## Docker-based Deployment
1. Push your code to GitHub
2. Create a new Web Service on Render:
   - Select "Docker" environment
   - Dockerfile Path: `Dockerfile.prod`
   - Environment: production
   - Add environment variable: 
        - Key: NODE_ENV 
          Value: production
3. Link to bookit-db database service (if applicable)

## Render Blueprint (Recommended)
1. Ensure these files are in your repository:
   - `render.yaml`
   - `Dockerfile.prod`
2. Go to Render Dashboard → New → Blueprint
3. Connect your GitHub repository
4. Click "Apply" to deploy both web service and database

## Local Testing
```bash
docker build -t bookit -f Dockerfile.prod .
docker run -p 3000:3000 bookit
```

## Post-Deployment
- Access your app at: `https://<your-service>.onrender.com`
- Test QR scanning: `https://quickchart.io/qr?text=https://<your-service>.onrender.com/business/test/reserve`

## Troubleshooting
- If build fails:
  - Verify Dockerfile syntax
  - Check for compatibility issues with Wasp version 0.16.6
- If app shows 404 errors:
  - Verify static file paths in serverSetup.js
  - Check routing configuration
- For database issues:
  - Verify connection string in render.yaml
  - Check database resource allocation
- Always inspect Render logs for detailed error messages