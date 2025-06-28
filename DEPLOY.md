# BookIT Deployment Guide (Docker-based)

## Prerequisites
1. Docker installed on your local machine (for testing)
2. Render.com account
3. GitHub repository with BookIT code

## Pure Node.js Deployment
1. Delete all Dockerfiles and Docker-related scripts
2. Push cleaned code to GitHub
3. Create new Web Service on Render:
   - Select "Node" environment
   - Build command: `npm run render-build`
   - Start command: `npm start`
   - Add environment variable:
        - Key: NODE_ENV
          Value: production
4. Link to bookit-db database service (if applicable)
5. IMPORTANT: Ensure service is set to "Node" environment, not Docker

## Render Blueprint
1. Ensure `render.yaml` is in your repository
2. Go to Render Dashboard → New → Blueprint
3. Connect your GitHub repository
4. Click "Apply" to deploy

## Local Testing
```bash
cd wasp-core
npx wasp build
node .wasp/build/server.js
```

## Local Testing (Native)
```bash
# Install dependencies
npm install

# Build the project
npm run render-build

# Start the server
npm start

# Access at http://localhost:3000
```

## Post-Deployment
- Access your app at: `https://<your-service>.onrender.com`
- Test QR scanning: `https://quickchart.io/qr?text=https://<your-service>.onrender.com/business/test/reserve`

## Troubleshooting
- If build fails:
  - If build fails:
    - Verify Node.js version compatibility (v18+)
    - Check for correct Wasp CLI installation
    - Ensure wasp-core directory exists with main.wasp file
  - If app shows 404 errors:
    - Verify static file paths in serverSetup.js
    - Check routing configuration
  - For database issues:
    - Verify connection string in render.yaml
    - Check database resource allocation
  - Always inspect Render logs for detailed error messages
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