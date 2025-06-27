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
# Build and run using the binary-based Dockerfile
docker build -t bookit -f Dockerfile.binary .
docker run -p 3000:3000 bookit

# Or use the build script (now uses binary approach):
./build.sh

# For the simplified Dockerfile:
docker build -t bookit-simple -f Dockerfile.simple .
docker run -p 3000:3000 bookit-simple
```

## Post-Deployment
- Access your app at: `https://<your-service>.onrender.com`
- Test QR scanning: `https://quickchart.io/qr?text=https://<your-service>.onrender.com/business/test/reserve`

## Troubleshooting
- If build fails:
  - Verify Dockerfile syntax
  - Check for compatibility issues with Wasp version 0.16.6
  - For binary installation issues, verify the download URL at:
    https://github.com/wasp-lang/wasp/releases/tag/v0.16.6
- If app shows 404 errors:
  - Verify static file paths in serverSetup.js
  - Check routing configuration
- For database issues:
  - Verify connection string in render.yaml
  - Check database resource allocation
- Always inspect Render logs for detailed error messages

## Alternative Deployment Method (Native Node.js)
If Docker deployment continues to fail, consider using Render's native Node.js environment:

1. Update render.yaml:
```yaml
services:
  - type: web
    name: bookit-web
    env: node
    buildCommand: npm install && npm run build
    startCommand: npm start
    envVars:
      - key: NODE_ENV
        value: production
```

2. Add build script to package.json:
```json
"scripts": {
  "build": "cd wasp-core && wasp build",
  "start": "node wasp-core/.wasp/build/server.js"
}
```

3. Commit and push changes