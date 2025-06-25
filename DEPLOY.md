# BookIT Deployment Guide (Simplified)

## Prerequisites
1. Render.com account
2. GitHub repository: https://github.com/beachbarbacoa/BookIT

## Deployment Steps
1. **Update Repository**:
   - Make sure these files exist in your project root:
     - [`render.yaml`](render.yaml)
     - [`Dockerfile.prod`](Dockerfile.prod)
   - Commit and push to GitHub

2. **Deploy via Blueprint**:
   - Go to Render Dashboard → New → Blueprint
   - Connect your BookIT GitHub repository
   - Name: `BookIT` (this will be your blueprint name)
   - Click "Apply" to deploy both services:
     - PostgreSQL database (bookit-db)
     - Web service (bookit)

## Post-Deployment
1. Access your app at: `https://bookit.onrender.com`
2. Test QR scanning with:
   - https://quickchart.io/qr?text=https://bookit.onrender.com/business/test/reserve

## Notes
- The [`render.yaml`](render.yaml) file defines:
  - PostgreSQL database with name `bookit-db`
  - Web service using Dockerfile.prod
  - Automatic connection between services
- Render will automatically handle:
  - Database creation
  - Environment variable setup
  - Docker-based deployment