# Configuration Files

This directory contains deployment and quality configuration files organized by purpose:

## Deployment (`/deployment`)
- `docker-compose.yml` - Docker Compose configuration
- `Dockerfile` - Docker container configuration  
- `netlify.toml` - Netlify deployment configuration
- `nginx.conf` - Nginx server configuration

## Quality (`/quality`)
- `lighthouserc.json` - Lighthouse CI configuration

## Root Level Configs (Required by Tools)
- `firebase.json` - Firebase Hosting configuration (required at root)
- `vercel.json` - Vercel deployment configuration (required at root)
- `sonar-project.properties` - SonarCloud analysis configuration (required at root)

## Usage

### Docker Deployment
```bash
# From project root
docker-compose -f config/deployment/docker-compose.yml up -d
```

### Firebase Deployment
```bash
# Firebase config is at root level (required by Firebase CLI)
firebase deploy
```

### Netlify Deployment
The `netlify.toml` file is automatically detected by Netlify when in the `config/deployment/` directory.

### Vercel Deployment
The `vercel.json` file is at root level (required by Vercel CLI).

### Quality Checks
```bash
# Lighthouse CI (configured in GitHub Actions)
lhci autorun --config=config/quality/lighthouserc.json

# SonarCloud (configured at root level)
sonar-scanner
```