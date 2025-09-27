# FTP Deployment Setup

This repository includes automated FTP deployment of `index.html` to `spintheweb.org` when changes are pushed to the main branch.

## Required GitHub Secrets

To enable FTP deployment, you need to configure the following secrets in your GitHub repository:

1. Go to your repository on GitHub
2. Click on **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret** and add:

### FTP_USERNAME
- **Name**: `FTP_USERNAME`
- **Value**: Your FTP username for spintheweb.org

### FTP_PASSWORD
- **Name**: `FTP_PASSWORD`
- **Value**: Your FTP password for spintheweb.org

## How it works

The workflow (`.github/workflows/deploy.yml`) will:

1. **Trigger**: Only when `index.html` is modified and pushed to the `main` branch
2. **Check**: Verifies that `index.html` actually changed in the commit
3. **Deploy**: Uses FTP to upload only the `index.html` file to the root directory of spintheweb.org

## Security Notes

- FTP credentials are stored securely as GitHub repository secrets
- Only the `index.html` file is deployed, other files are excluded
- The workflow only runs on the main branch

## Manual Deployment

If you need to deploy manually, you can also trigger the workflow by pushing a change to `index.html` or running the workflow manually from the Actions tab in GitHub.