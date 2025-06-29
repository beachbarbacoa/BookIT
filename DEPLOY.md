# BookIT Deployment Guide (Render Blueprint)

This is the definitive guide to deploying the BookIT application on Render. The root cause of all previous failures was a misconfigured, multi-part deployment. The solution is to use a **Render Blueprint**, which defines both the web service and the database in a single `render.yaml` file.

**CRITICAL FIRST STEP: You MUST delete all old services AND the database for this project on Render before proceeding.**

## Step 1: Delete ALL Existing Infrastructure on Render

1.  Go to your Render Dashboard.
2.  **Delete the Web Service(s):** Find any web service related to this project (e.g., `bookit-web`, `bookit`). For each one, go to its **Settings** tab and click **Delete Service**.
3.  **Delete the Database:** Find the database named `bookit-db`.
    *   **Warning: Deleting the 'bookit-db' database will permanently erase all of its data. Only proceed if you have a backup or if the data is not critical.**
    *   Go to its **Settings** tab and click **Delete Database**.

## Step 2: Ensure Your Code is on GitHub

Make sure your latest code, including the corrected `render.yaml` blueprint, is pushed to your GitHub repository.

## Step 3: Create a New Blueprint on Render

1.  Go to your Render Dashboard and click **New +** > **Blueprint**.
2.  Connect your GitHub repository. Render will automatically find and parse your `render.yaml` file.
3.  You will see two new services planned: `bookit-web` (Web Service) and `bookit-db` (PostgreSQL).
4.  Click **Apply** to create and deploy both services.

Render will now create a fresh database and a fresh web service, automatically linking them together. This is the most robust and reliable way to deploy your application.

**Note:** The previous version of this guide used an incorrect Blueprint structure. The `render.yaml` has been updated to use a top-level `databases` key, which is the correct syntax.