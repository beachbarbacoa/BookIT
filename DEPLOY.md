# BookIT Deployment Guide (Docker-based)

## Prerequisites
1. Docker installed on your local machine (for testing)
2. Render.com account
3. GitHub repository with BookIT code

## Native Node.js Deployment
1. Push your code to GitHub
2. Create a new Web Service on Render:
   - Select "Node" environment
   - Connect to your GitHub repository
   - Set build command:
        ```bash
        npm install
        cd wasp-core
        npx wasp build
        ```
   - Set start command: `node wasp-core/.wasp/build/server.js`
   - Add environment variable:
        - Key: NODE_ENV
          Value: production
3. Link to bookit-db database service (if applicable)

## Render Blueprint
1. Ensure `render.yaml` and `.renderignore` are in your repository
2. Go to Render Dashboard → New → Blueprint
3. Connect your GitHub repository
4. Click "Apply" to deploy

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