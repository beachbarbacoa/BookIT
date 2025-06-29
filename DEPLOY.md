# BookIT Deployment Guide (Native Node.js on Render)

This guide provides instructions for deploying the BookIT application to Render.com using a native Node.js environment.

**CRITICAL FIRST STEP: You MUST delete all old services for this project on Render before proceeding.** The old services are stuck in a misconfigured state and will cause the deployment to fail.

## Step 1: Delete ALL Existing Render Services

1.  Go to your Render Dashboard.
2.  Find any service related to this project (e.g., `bookit-web`, `bookit`).
3.  For **EACH** service:
    *   Click on the service to go to its page.
    *   Go to the **Settings** tab.
    *   Scroll to the bottom and click the **Delete Service** button.
    *   Confirm the deletion.
4.  Repeat until no services for this project remain.

## Step 2: Ensure Your Code is on GitHub

Make sure your latest code, including `render.yaml`, `.nvmrc`, and `package.json`, is pushed to your GitHub repository. (You have already done this, which is perfect).

## Step 3: Create a New Web Service on Render

1.  Go to your Render Dashboard and click **New +** > **Web Service**.
2.  Connect your GitHub repository.
3.  Render should automatically detect the settings from `render.yaml`. Verify that the following settings are correct:
    *   **Environment:** `Node`
    *   **Region:** `Oregon` (or your preferred region)
    *   **Branch:** `main`
    *   **Build Command:** `npm install && npx --yes @wasp/cli@0.16.6 build`
    *   **Start Command:** `npm start`
4.  Click **Create Web Service**.

The first deployment on this brand new service will use the correct settings and will succeed.

## Local Testing

1.  **Install Dependencies:** `npm install`
2.  **Build the Project:** `npx --yes @wasp/cli@0.16.6 build`
3.  **Start the Server:** `npm start`