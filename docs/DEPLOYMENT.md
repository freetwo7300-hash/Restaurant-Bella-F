# Deployment Guide

Comprehensive guide to deploying the Bella Restaurant application.

## Table of Contents

- [Overview](#overview)
- [Deployment Platforms](#deployment-platforms)
- [Pre-Deployment Checklist](#pre-deployment-checklist)
- [GitHub Pages](#github-pages)
- [Netlify](#netlify)
- [Vercel](#vercel)
- [AWS](#aws)
- [Firebase](#firebase)
- [Docker](#docker)
- [Environment Configuration](#environment-configuration)
- [Monitoring](#monitoring)
- [Troubleshooting](#troubleshooting)

## Overview

The application supports deployment to multiple platforms:

- **GitHub Pages**: Free static hosting
- **Netlify**: Serverless hosting with CI/CD
- **Vercel**: Optimized for Next.js and static sites
- **AWS**: Scalable cloud infrastructure
- **Firebase**: Google Cloud integration
- **Docker**: Containerized deployment

## Deployment Platforms

### Platform Comparison

| Platform | Cost | Setup | Performance | Features |
|----------|------|-------|-------------|----------|
| GitHub Pages | Free | Easy | Good | Basic |
| Netlify | Free/Paid | Easy | Excellent | Advanced |
| Vercel | Free/Paid | Easy | Excellent | Advanced |
| AWS | Paid | Complex | Excellent | Comprehensive |
| Firebase | Free/Paid | Medium | Good | Google integration |
| Docker | Varies | Medium | Excellent | Full control |

## Pre-Deployment Checklist

Before deploying, ensure:

- [ ] All tests pass: `npm run test:ci`
- [ ] Linting passes: `npm run lint`
- [ ] Build succeeds: `npm run build:prod`
- [ ] No console errors or warnings
- [ ] Environment variables configured
- [ ] Security headers configured
- [ ] Performance optimized
- [ ] Accessibility tested
- [ ] Cross-browser tested
- [ ] Mobile responsive verified

## GitHub Pages

### Setup

1. **Enable GitHub Pages**
   - Go to repository Settings
   - Navigate to Pages
   - Select `gh-pages` branch as source

2. **Configure Angular**
   - Update `angular.json`:
   ```json
   {
     "projects": {
       "resturent": {
         "architect": {
           "build": {
             "options": {
               "baseHref": "/resturent/"
             }
           }
         }
       }
     }
   }
   ```

3. **Build and Deploy**
   ```bash
   # Build for GitHub Pages
   ng build --configuration production --base-href="/resturent/"
   
   # Deploy to gh-pages branch
   npx angular-cli-ghpages --dir=dist/resturent
   ```

### Workflow

GitHub Actions workflow for automatic deployment:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '20'
          cache: 'npm'
      - run: npm ci
      - run: npm run build:prod -- --base-href="/resturent/"
      - uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./dist/resturent
```

### Custom Domain

1. Add `CNAME` file to `public/` folder:
   ```
   bella-flax.vercel.app
   ```

2. Configure DNS records:
   - Add CNAME record pointing to `cname.vercel-dns.com`

## Netlify

### Setup

1. **Connect Repository**
   - Go to https://netlify.com
   - Click "New site from Git"
   - Select GitHub and authorize
   - Choose repository

2. **Configure Build**
   - Build command: `npm run build:prod`
   - Publish directory: `dist/resturent`

3. **Environment Variables**
   - Go to Site settings → Build & deploy → Environment
   - Add environment variables:
   ```
   NODE_ENV=production
   API_BASE_URL=https://api.example.com
   VERCEL_URL=https://bella-flax.vercel.app
   ```

### Netlify Configuration

Create `netlify.toml`:

```toml
[build]
  command = "npm run build:prod"
  publish = "dist/resturent"

[build.environment]
  NODE_VERSION = "20"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200

[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-Content-Type-Options = "nosniff"
    X-XSS-Protection = "1; mode=block"
    Strict-Transport-Security = "max-age=31536000; includeSubDomains"

[[headers]]
  for = "/assets/*"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

[[headers]]
  for = "/*.js"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"

[[headers]]
  for = "/*.css"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"
```

### Deployment

```bash
# Install Netlify CLI
npm install -g netlify-cli

# Deploy
netlify deploy --prod --dir=dist/resturent
```

## Vercel

### Setup

1. **Connect Repository**
   - Go to https://vercel.com
   - Click "New Project"
   - Import GitHub repository

2. **Configure Project**
   - Framework: Other
   - Build command: `npm run build:prod`
   - Output directory: `dist/resturent`

3. **Environment Variables**
   - Add in Project Settings → Environment Variables

### Vercel Configuration

Create `vercel.json`:

```json
{
  "buildCommand": "npm run build:prod",
  "outputDirectory": "dist/resturent",
  "env": {
    "NODE_ENV": "production"
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
        }
      ]
    }
  ],
  "rewrites": [
    {
      "source": "/(.*)",
      "destination": "/index.html"
    }
  ]
}
```

### Deployment

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel --prod
```

## AWS

### S3 + CloudFront

1. **Create S3 Bucket**
   ```bash
   aws s3 mb s3://bella-restaurant-prod
   ```

2. **Upload Build**
   ```bash
   aws s3 sync dist/resturent s3://bella-restaurant-prod --delete
   ```

3. **Create CloudFront Distribution**
   - Origin: S3 bucket
   - Default root object: index.html
   - Error pages: 404 → index.html

4. **Configure DNS**
   - Point domain to CloudFront distribution

### AWS Deployment Script

```bash
#!/bin/bash

# Build
npm run build:prod

# Upload to S3
aws s3 sync dist/resturent s3://bella-restaurant-prod --delete

# Invalidate CloudFront
aws cloudfront create-invalidation \
  --distribution-id YOUR_DISTRIBUTION_ID \
  --paths "/*"

echo "Deployment complete!"
```

## Firebase

### Setup

1. **Initialize Firebase**
   ```bash
   npm install -g firebase-tools
   firebase login
   firebase init hosting
   ```

2. **Configure `firebase.json`**
   ```json
   {
     "hosting": {
       "public": "dist/resturent",
       "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
       "rewrites": [
         {
           "source": "**",
           "destination": "/index.html"
         }
       ]
     }
   }
   ```

3. **Deploy**
   ```bash
   npm run build:prod
   firebase deploy
   ```

## Docker

### Build Docker Image

```bash
# Build image
docker build -t bella-restaurant:latest .

# Tag for registry
docker tag bella-restaurant:latest your-registry/bella-restaurant:latest

# Push to registry
docker push your-registry/bella-restaurant:latest
```

### Run Docker Container

```bash
# Run locally
docker run -p 80:80 bella-restaurant:latest

# Run with environment variables
docker run -p 80:80 \
  -e API_BASE_URL=https://api.example.com \
  bella-restaurant:latest
```

### Docker Compose

```bash
# Start services
docker-compose up -d

# Stop services
docker-compose down

# View logs
docker-compose logs -f
```

## Environment Configuration

### Environment Variables

Create `.env.production`:

```
NODE_ENV=production
API_BASE_URL=https://api.example.com
API_TIMEOUT=30000
FIREBASE_API_KEY=your_api_key
FIREBASE_AUTH_DOMAIN=your_auth_domain
FIREBASE_PROJECT_ID=your_project_id
```

### Build Configurations

```bash
# Development
ng build --configuration development

# Staging
ng build --configuration staging

# Production
ng build --configuration production
```

### Angular Configuration

In `angular.json`:

```json
{
  "configurations": {
    "development": {
      "optimization": false,
      "sourceMap": true
    },
    "staging": {
      "optimization": true,
      "sourceMap": false,
      "budgets": [
        {
          "type": "bundle",
          "maximumWarning": "2mb",
          "maximumError": "5mb"
        }
      ]
    },
    "production": {
      "optimization": true,
      "sourceMap": false,
      "budgets": [
        {
          "type": "bundle",
          "maximumWarning": "1mb",
          "maximumError": "2mb"
        }
      ]
    }
  }
}
```

## Monitoring

### Application Monitoring

- **Google Analytics**: Track user behavior
- **Sentry**: Error tracking
- **New Relic**: Performance monitoring
- **DataDog**: Infrastructure monitoring

### Health Checks

```bash
# Check application health
curl https://yourdomain.com/health

# Check API connectivity
curl https://api.example.com/health
```

### Performance Monitoring

```bash
# Run Lighthouse audit
npm run analyze

# Check bundle size
npm run build:prod -- --stats-json
npx webpack-bundle-analyzer dist/resturent/stats.json
```

## Troubleshooting

### Common Issues

#### 1. Build Fails

```bash
# Clear cache
rm -rf .angular/cache dist/

# Rebuild
npm run build:prod
```

#### 2. Routing Issues

Ensure SPA routing is configured:

- **Netlify**: Add `_redirects` file
- **Vercel**: Configure `vercel.json`
- **AWS**: Configure CloudFront error pages
- **Firebase**: Configure `firebase.json`

#### 3. Environment Variables Not Loading

```bash
# Verify environment variables
echo $API_BASE_URL

# Check build output
grep -r "API_BASE_URL" dist/
```

#### 4. Performance Issues

```bash
# Analyze bundle
npm run analyze

# Check performance
npm run build:prod -- --stats-json
```

#### 5. CORS Issues

Configure CORS headers on API server:

```
Access-Control-Allow-Origin: https://yourdomain.com
Access-Control-Allow-Methods: GET, POST, PUT, DELETE
Access-Control-Allow-Headers: Content-Type, Authorization
```

## Rollback

### Rollback Procedure

1. **Identify Issue**: Check logs and monitoring
2. **Revert Code**: `git revert <commit-hash>`
3. **Rebuild**: `npm run build:prod`
4. **Redeploy**: Use deployment platform
5. **Verify**: Test application
6. **Communicate**: Notify team

## Deployment Checklist

- [ ] Code reviewed and approved
- [ ] All tests passing
- [ ] Build succeeds
- [ ] Environment variables configured
- [ ] Security headers set
- [ ] Performance optimized
- [ ] Monitoring configured
- [ ] Backup created
- [ ] Deployment plan documented
- [ ] Team notified

## Resources

- [Angular Deployment Guide](https://angular.io/guide/deployment)
- [Netlify Documentation](https://docs.netlify.com/)
- [Vercel Documentation](https://vercel.com/docs)
- [AWS Deployment Guide](https://aws.amazon.com/getting-started/)
- [Firebase Hosting](https://firebase.google.com/docs/hosting)
- [Docker Documentation](https://docs.docker.com/)

---

Last updated: March 2026
