# Bella Restaurant - CI/CD Pipeline Documentation

## Overview

This project includes a comprehensive CI/CD pipeline using GitHub Actions that handles testing, building, security scanning, and deployment to multiple platforms.

## Pipeline Structure

### 1. Continuous Integration (CI) - `.github/workflows/ci.yml`

**Triggers:**
- Push to `main` or `develop` branches
- Pull requests to `main` or `develop` branches

**Jobs:**
- **Test**: Runs unit tests on Node.js 18.x and 20.x
- **Build**: Creates production build artifacts
- **Security Scan**: Performs security audits and vulnerability scanning

### 2. Staging Deployment - `.github/workflows/cd-staging.yml`

**Triggers:**
- Push to `develop` branch
- Manual workflow dispatch

**Deployment Targets:**
- Netlify (Primary)
- Vercel (Alternative)
- Slack notifications

### 3. Production Deployment - `.github/workflows/cd-production.yml`

**Triggers:**
- Push to `main` branch
- Release published
- Manual workflow dispatch

**Deployment Targets:**
- GitHub Pages
- Netlify Production
- AWS S3 + CloudFront
- Firebase Hosting
- Automatic GitHub releases

### 4. Quality Checks - `.github/workflows/quality-checks.yml`

**Features:**
- ESLint and Prettier checks
- SonarCloud code analysis
- CodeQL security analysis
- Dependency vulnerability scanning
- Lighthouse performance audits

### 5. Docker Pipeline - `.github/workflows/docker.yml`

**Features:**
- Multi-platform Docker builds (AMD64, ARM64)
- Container registry publishing (GitHub Container Registry)
- Docker-based deployments

## Required Secrets

Add these secrets to your GitHub repository settings:

### Deployment Secrets
```
NETLIFY_AUTH_TOKEN          # Netlify deployment token
NETLIFY_STAGING_SITE_ID     # Staging site ID
NETLIFY_PRODUCTION_SITE_ID  # Production site ID

VERCEL_TOKEN               # Vercel deployment token
VERCEL_ORG_ID             # Vercel organization ID
VERCEL_PROJECT_ID         # Vercel project ID

AWS_ACCESS_KEY_ID         # AWS access key
AWS_SECRET_ACCESS_KEY     # AWS secret key
AWS_REGION               # AWS region (e.g., us-east-1)
S3_BUCKET               # S3 bucket name
CLOUDFRONT_DISTRIBUTION_ID # CloudFront distribution ID

FIREBASE_TOKEN           # Firebase deployment token
FIREBASE_SERVICE_ACCOUNT # Firebase service account JSON
FIREBASE_PROJECT_ID     # Firebase project ID
```

### Quality & Security Secrets
```
SONAR_TOKEN             # SonarCloud token
SNYK_TOKEN             # Snyk security scanning token
SLACK_WEBHOOK          # Slack webhook for notifications
```

## Deployment Platforms

### 1. GitHub Pages
- **URL**: `https://mostafa-said7.github.io/Bella/`
- **Trigger**: Push to main branch
- **Custom Domain**: Configure in repository settings

### 2. Netlify
- **Staging**: Automatic deployment from `develop` branch
- **Production**: Automatic deployment from `main` branch
- **Features**: Branch previews, form handling, edge functions

### 3. Vercel
- **Alternative deployment platform**
- **Features**: Serverless functions, edge network, analytics

### 4. AWS S3 + CloudFront
- **High-performance hosting**
- **Global CDN distribution**
- **Custom domain support**

### 5. Firebase Hosting
- **Google Cloud integration**
- **Global CDN**
- **SSL certificates**

## Docker Deployment

### Build Docker Image
```bash
npm run docker:build
```

### Run Docker Container
```bash
npm run docker:run
```

### Docker Compose
```bash
docker-compose up -d
```

## Local Development

### Prerequisites
- Node.js 18.x or 20.x
- npm or yarn

### Setup
```bash
# Install dependencies
npm install

# Start development server
npm start

# Run tests
npm test

# Run linting
npm run lint

# Format code
npm run format

# Build for production
npm run build:prod
```

## Quality Assurance

### Code Quality Tools
- **ESLint**: TypeScript and Angular linting
- **Prettier**: Code formatting
- **SonarCloud**: Code quality analysis
- **CodeQL**: Security analysis

### Performance Monitoring
- **Lighthouse CI**: Performance, accessibility, SEO audits
- **Bundle Analyzer**: Bundle size analysis

### Security Scanning
- **npm audit**: Dependency vulnerability scanning
- **Snyk**: Advanced security scanning
- **Dependency Review**: GitHub's dependency analysis

## Branch Strategy

### Main Branches
- **`main`**: Production-ready code
- **`develop`**: Integration branch for features

### Feature Workflow
1. Create feature branch from `develop`
2. Implement feature with tests
3. Create pull request to `develop`
4. CI pipeline runs automatically
5. Code review and merge
6. Staging deployment triggers
7. Merge `develop` to `main` for production

## Monitoring & Notifications

### Slack Integration
- Deployment notifications
- Build status updates
- Security alerts

### Health Checks
- Docker container health checks
- Nginx health endpoints
- Application monitoring

## Environment Configuration

### Environment Variables
```bash
NODE_ENV=production          # Environment mode
API_BASE_URL=https://api...  # API endpoint
FIREBASE_CONFIG={}          # Firebase configuration
```

### Build Configurations
- **Development**: Source maps, no optimization
- **Staging**: Partial optimization, debugging enabled
- **Production**: Full optimization, minification, tree-shaking

## Troubleshooting

### Common Issues

1. **Build Failures**
   - Check Node.js version compatibility
   - Verify all dependencies are installed
   - Review build logs in Actions tab

2. **Deployment Failures**
   - Verify secrets are correctly configured
   - Check deployment platform status
   - Review deployment logs

3. **Test Failures**
   - Run tests locally first
   - Check for browser compatibility issues
   - Verify test environment setup

### Debug Commands
```bash
# Check build locally
npm run build:prod

# Run tests with coverage
npm run test:ci

# Lint and format check
npm run lint && npm run format:check

# Analyze bundle size
npm run analyze
```

## Performance Optimization

### Build Optimizations
- Tree shaking for unused code elimination
- Code splitting for better caching
- Asset optimization and compression
- Service worker for offline support

### Deployment Optimizations
- CDN distribution
- Gzip compression
- Browser caching headers
- Image optimization

## Security Best Practices

### Implemented Security Measures
- Content Security Policy (CSP)
- Security headers (X-Frame-Options, X-XSS-Protection)
- Dependency vulnerability scanning
- Code security analysis
- Container security scanning

### Recommendations
- Regular dependency updates
- Security patch management
- Access control reviews
- SSL/TLS configuration
- Environment variable protection

## Contributing

1. Fork the repository
2. Create a feature branch
3. Follow coding standards (ESLint + Prettier)
4. Write tests for new features
5. Ensure all CI checks pass
6. Submit a pull request

## Support

For issues with the CI/CD pipeline:
1. Check the Actions tab for detailed logs
2. Review this documentation
3. Create an issue with relevant logs and context