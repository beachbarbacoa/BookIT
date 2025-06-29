# BookIT Deployment Guide (Render Blueprint - Final)

This is the definitive guide to deploying the BookIT application on Render. The previous build failures were caused by an issue with `npx` being unable to fetch the Wasp CLI. The solution is to make the Wasp CLI an explicit `devDependency` in `package.json`.

## Step 1: Delete ALL Existing Infrastructure on Render

To ensure a clean slate, you **MUST** delete any old services or databases related to this project on Render.

1.  Go to your Render Dashboard.
2.  For each service (`bookit-web`, `bookit`) and database (`bookit-db`), go to its **Settings** tab and delete it.
    *   **Warning:** Deleting the database will permanently erase its data.

## Step 2: Ensure Your Code is on GitHub

Make sure your latest code, including the updated `render.yaml` and `package.json`, is pushed to your GitHub repository.

## Step 3: Create a New Blueprint on Render

1.  Go to your Render Dashboard and click **New +** > **Blueprint**.
2.  Connect your GitHub repository. Render will automatically find and parse your `render.yaml` file.
3.  You will see two new services planned: `bookit-web` (Web Service) and `bookit-db` (PostgreSQL).
4.  Click **Apply** to create and deploy both services.

The build command is now `npm install && npm run build`, which is a more standard and reliable approach.

## Local Testing

1.  **Install Dependencies:** `npm install`
2.  **Build the Project:** `npm run build`
3.  **Start the Server:** `npm start`