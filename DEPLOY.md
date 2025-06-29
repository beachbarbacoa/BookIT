# BookIT Deployment Guide (Native Node.js on Render)

This guide provides instructions for deploying the BookIT application to Render.com using a native Node.js environment. This is the recommended and most reliable deployment method.

## Prerequisites

1.  A Render.com account.
2.  A GitHub repository with the BookIT code.

## Deployment Steps

1.  **Push to GitHub:** Ensure the latest code, including `render.yaml`, `.nvmrc`, and `package.json`, is pushed to your GitHub repository.

2.  **Create a New Web Service on Render:**
    *   Go to your Render Dashboard and click **New +** > **Web Service**.
    *   Connect your GitHub repository.
    *   Render should automatically detect the settings from `render.yaml`. Verify that the following settings are correct:
        *   **Environment:** `Node`
        *   **Region:** `Oregon` (or your preferred region)
        *   **Branch:** `main`
        *   **Build Command:** `npm install && npx --yes @wasp/cli@0.16.6 build`
        *   **Start Command:** `npm start`
    *   Click **Create Web Service**.

3.  **Clear Build Cache (Important for First Deployment with New Settings):**
    *   After creating the service, go to the **Settings** tab for your new service.
    *   Scroll down to the **Build & Deploy** section.
    *   Click **Clear build cache & deploy**. This is crucial to ensure Render doesn't use any old, cached settings.

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

## Troubleshooting

*   **Build Failures:**
    *   Ensure your GitHub repository is up to date.
    *   Verify that the Node.js version in `render.yaml` (`20`) is compatible with your project.
    *   Check the build logs on Render for specific error messages.
*   **Application Errors:**
    *   Check the runtime logs on Render for any errors.
    *   Ensure all required environment variables are set correctly in `render.yaml`.