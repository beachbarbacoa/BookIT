# BookIT Deployment Guide (Native Node.js on Render)

This guide provides instructions for deploying the BookIT application to Render.com using a native Node.js environment.

**IMPORTANT:** If you have an existing service on Render for this project, you **MUST** delete it and create a new one. The existing service is likely stuck in a Docker configuration and will not deploy correctly.

## Step 1: Delete Existing Render Service

1.  Go to your Render Dashboard.
2.  Find the existing service for this project (e.g., `bookit-web`).
3.  Click on the service to go to its page.
4.  Go to the **Settings** tab.
5.  Scroll to the bottom and click the **Delete Service** button.
6.  Confirm the deletion.

## Step 2: Create a New Web Service on Render

1.  **Push to GitHub:** Ensure the latest code, including `render.yaml`, `.nvmrc`, and `package.json`, is pushed to your GitHub repository.

2.  **Create the Service:**
    *   Go to your Render Dashboard and click **New +** > **Web Service**.
    *   Connect your GitHub repository.
    *   Render should automatically detect the settings from `render.yaml`. Verify that the following settings are correct:
        *   **Environment:** `Node`
        *   **Region:** `Oregon` (or your preferred region)
        *   **Branch:** `main`
        *   **Build Command:** `npm install && npx --yes @wasp/cli@0.16.6 build`
        *   **Start Command:** `npm start`
    *   Click **Create Web Service**.

The first deployment on the new service will use the correct settings and should succeed.

## Local Testing

To test the application locally, follow these steps:

1.  **Install Dependencies:**
    ```bash
    npm install
    ```

2.  **Build the Project:**
    ```bash
    npx --yes @wasp/cli@0.16.6 build
    ```

3.  **Start the Server:**
    ```bash
    npm start
    ```

4.  Access the application at `http://localhost:3001` (or the port specified in your Wasp project).