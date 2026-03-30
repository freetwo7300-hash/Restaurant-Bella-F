# Vercel Deployment Setup

Complete guide to setting up and deploying Bella Restaurant on Vercel.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Initial Setup](#initial-setup)
- [Configuration](#configuration)
- [Deployment](#deployment)
- [Environment Variables](#environment-variables)
- [Monitoring](#monitoring)
- [Troubleshooting](#troubleshooting)

## Prerequisites

- Vercel account (https://vercel.com)
- GitHub repository connected to Vercel
- Node.js 18.x or 20.x
- npm 9.x or higher

## Initial Setup

### 1. Create Vercel Account

1. Go to https://vercel.com
2. Sign up with GitHub account
3. Authorize Vercel to access your repositories

### 2. Import Project

1. Click "New Project"
2. Select your GitHub repository
3. Vercel will auto-detect Angular configuration
4. Click "Deploy"

**Live Demo**: https://bella-flax.vercel.app/

### 3. Get Vercel Credentials

For GitHub Actions integration, you need:

1. **VERCEL_TOKEN**
   - Go to Account Settings → Tokens
   - Create new token
   - Copy token value

2. **VERCEL_ORG_ID**
   - Go to Account Settings → General
   - Find "Team ID" or "Org ID"

3. **VERCEL_PROJECT_ID**
   - Go to Project Settings → General
   - Find "Project ID"

## Configuration

### Vercel Configuration File

Create `vercel.json` in project root:

```json
{
  "buildCommand": "npm run build:prod",
  "outputDirectory": "dist/resturent",
  "framework": "angular",
  "nodeVersion": "20.x",
  "env": {
    "NODE_ENV": "production",
    "VERCEL_URL": "https://bella-flax.vercel.app"
  },
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "X-Frame-Options",
          "value": "DENY"
        },
        {
          "key": "X-Content-Type-Options",
          "value": "nosniff"
        },
        {
          "key": "X-XSS-Protection",
          "value": "1; mode=block"
        },
        {
          "key": "Strict-Transport-Security",
          "value": "max-age=31536000; includeSubDomains"
        }
      ]
    }
  ],
  "rewrites": [
    {
      "source": "/(.*)",
      "destination": "/index.html"
    }
  ],
  "redirects": [
    {
      "source": "/old-page",
      "destination": "/new-page",
      "permanent": true
    }
  ]
}
```

### GitHub Secrets

Add these secrets to your GitHub repository:

1. Go to Settings → Secrets and variables → Actions
2. Add new repository secrets:

```
VERCEL_TOKEN=<your-token>
VERCEL_ORG_ID=<your-org-id>
VERCEL_PROJECT_ID=<your-project-id>
```

## Deployment

### Automatic Deployment

Vercel automatically deploys on:

- **Push to main** → Production deployment
- **Push to develop** → Preview deployment
- **Pull requests** → Preview deployment

### Manual Deployment

Using Vercel CLI:

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy to production
vercel --prod

# Deploy to preview
vercel

# Deploy with environment
vercel --env NODE_ENV=production
```

### GitHub Actions Deployment

The workflow automatically deploys:

```yaml
- name: Deploy to Vercel (Production)
  if: github.ref == 'refs/heads/main'
  uses: amondnet/vercel-action@v25
  with:
    vercel-token: ${{ secrets.VERCEL_TOKEN }}
    vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
    vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}
    vercel-args: '--prod'
```

## Environment Variables

### Setting Environment Variables

#### In Vercel Dashboard

1. Go to Project Settings → Environment Variables
2. Add variables for each environment:
   - Production
   - Preview
   - Development

#### In GitHub Actions

```yaml
env:
  NODE_ENV: production
  API_BASE_URL: https://api.example.com
```

### Required Variables

```
NODE_ENV=production
API_BASE_URL=https://api.example.com
API_TIMEOUT=30000
```

### Optional Variables

```
FIREBASE_API_KEY=your_api_key
FIREBASE_AUTH_DOMAIN=your_auth_domain
FIREBASE_PROJECT_ID=your_project_id
FIREBASE_STORAGE_BUCKET=your_storage_bucket
FIREBASE_MESSAGING_SENDER_ID=your_sender_id
FIREBASE_APP_ID=your_app_id
```

## Monitoring

### Vercel Analytics

1. Go to Project → Analytics
2. Monitor:
   - Page load times
   - Core Web Vitals
   - Traffic patterns
   - Error rates

### Build Logs

1. Go to Deployments
2. Click on deployment
3. View build logs and output

### Performance Monitoring

```bash
# Check performance locally
npm run analyze

# Check bundle size
npm run build:prod -- --stats-json
npx webpack-bundle-analyzer dist/resturent/stats.json
```

## Custom Domain

### Add Custom Domain

1. Go to Project Settings → Domains
2. Click "Add Domain"
3. Enter your domain (e.g., bella-flax.vercel.app)
4. Configure DNS records:

```
Type: CNAME
Name: www
Value: cname.vercel-dns.com
```

Or for root domain:

```
Type: A
Name: @
Value: 76.76.19.165
```

**Current Domain**: https://bella-flax.vercel.app/

### SSL Certificate

Vercel automatically provides SSL certificates via Let's Encrypt.

## Rollback

### Rollback to Previous Deployment

1. Go to Deployments
2. Find previous deployment
3. Click "Promote to Production"

### Rollback via CLI

```bash
# List deployments
vercel list

# Promote specific deployment
vercel promote <deployment-url>
```

## Troubleshooting

### Build Fails

**Issue**: Build command fails

**Solution**:
```bash
# Check build locally
npm run build:prod

# Check for errors
npm run lint
npm run format:check
```

### Environment Variables Not Loading

**Issue**: Variables undefined in application

**Solution**:
1. Verify variables in Vercel dashboard
2. Redeploy after adding variables
3. Check variable names match code

### Deployment Timeout

**Issue**: Deployment takes too long

**Solution**:
1. Optimize build process
2. Increase timeout in vercel.json
3. Check for large dependencies

### CORS Issues

**Issue**: API calls blocked

**Solution**:
1. Configure CORS on API server
2. Use proxy in vercel.json:

```json
{
  "rewrites": [
    {
      "source": "/api/(.*)",
      "destination": "https://api.example.com/$1"
    }
  ]
}
```

### Preview Deployment Not Working

**Issue**: Preview deployments fail

**Solution**:
1. Check branch protection rules
2. Verify GitHub Actions permissions
3. Check Vercel project settings

## Performance Optimization

### Build Optimization

```json
{
  "buildCommand": "npm run build:prod -- --optimization --build-optimizer",
  "outputDirectory": "dist/resturent"
}
```

### Caching

```json
{
  "headers": [
    {
      "source": "/assets/(.*)",
      "headers": [
        {
          "key": "Cache-Control",
          "value": "public, max-age=31536000, immutable"
        }
      ]
    }
  ]
}
```

### Image Optimization

Use Vercel Image Optimization:

```html
<img src="/image.jpg" alt="Description" loading="lazy" />
```

## Security

### Security Headers

Already configured in vercel.json:
- X-Frame-Options: DENY
- X-Content-Type-Options: nosniff
- X-XSS-Protection: 1; mode=block
- Strict-Transport-Security: max-age=31536000

### Environment Variable Security

- Never commit secrets to repository
- Use GitHub Secrets for sensitive data
- Rotate tokens regularly
- Use different tokens for different environments

## Monitoring & Alerts

### Set Up Alerts

1. Go to Project Settings → Alerts
2. Configure notifications for:
   - Build failures
   - Deployment errors
   - Performance issues

### Slack Integration

1. Install Vercel Slack app
2. Connect to workspace
3. Receive deployment notifications

## Advanced Configuration

### Custom Build Script

```json
{
  "buildCommand": "npm run build:prod && npm run analyze"
}
```

### Multiple Environments

```json
{
  "env": {
    "production": {
      "NODE_ENV": "production"
    },
    "preview": {
      "NODE_ENV": "staging"
    }
  }
}
```

### Serverless Functions

Create `api/` directory for serverless functions:

```typescript
// api/hello.ts
export default function handler(req, res) {
  res.status(200).json({ message: 'Hello from Vercel' });
}
```

## Resources

- [Vercel Documentation](https://vercel.com/docs)
- [Vercel Angular Guide](https://vercel.com/guides/deploying-angular-with-vercel)
- [Vercel CLI](https://vercel.com/cli)
- [Vercel GitHub Integration](https://vercel.com/docs/git/vercel-for-github)

## Support

- [Vercel Support](https://vercel.com/support)
- [Vercel Community](https://github.com/vercel/vercel/discussions)
- [GitHub Issues](https://github.com/your-org/resturent/issues)

---

Last updated: March 2026
