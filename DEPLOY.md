# BookIT Deployment Guide (Render Blueprint - Simplified)

This is the definitive guide to deploying the BookIT application on Render. The previous "sync failed" error indicated a problem with parsing the `render.yaml` file. This has been resolved by simplifying the Blueprint to its bare essentials.

## Step 1: Delete ALL Existing Infrastructure on Render

To ensure a clean slate, you **MUST** delete any old services or databases related to this project on Render.

1.  Go to your Render Dashboard.
2.  For each service (`bookit-web`, `bookit`) and database (`bookit-db`), go to its **Settings** tab and delete it.
    *   **Warning:** Deleting the database will permanently erase its data.

## Step 2: Ensure Your Code is on GitHub

Make sure your latest code, including the simplified `render.yaml` and corrected `package.json`, is pushed to your GitHub repository.

## Step 3: Create a New Blueprint on Render

1.  Go to your Render Dashboard and click **New +** > **Blueprint**.
2.  Connect your GitHub repository. Render will automatically find and parse your `render.yaml` file.
3.  You will see two new services planned: `bookit-web` (Web Service) and `bookit-db` (PostgreSQL).
4.  Click **Apply** to create and deploy both services.

This simplified Blueprint should now be parsed correctly by Render, resolving the "sync failed" error.

## Local Testing

1.  **Install Dependencies:** `npm install`
2.  **Build the Project:** `npm run build`
3.  **Start the Server:** `npm start`