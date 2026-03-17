#!/bin/bash

# Bella Restaurant Deployment Script
# Usage: ./scripts/deploy.sh [environment]
# Environments: staging, production

set -e

ENVIRONMENT=${1:-staging}
PROJECT_NAME="bella-restaurant"

echo "🚀 Starting deployment to $ENVIRONMENT..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if environment is valid
if [[ "$ENVIRONMENT" != "staging" && "$ENVIRONMENT" != "production" ]]; then
    print_error "Invalid environment. Use 'staging' or 'production'"
    exit 1
fi

# Check if required tools are installed
check_dependencies() {
    print_status "Checking dependencies..."
    
    if ! command -v node &> /dev/null; then
        print_error "Node.js is not installed"
        exit 1
    fi
    
    if ! command -v npm &> /dev/null; then
        print_error "npm is not installed"
        exit 1
    fi
    
    print_status "Dependencies check passed ✅"
}

# Install dependencies
install_dependencies() {
    print_status "Installing dependencies..."
    npm ci
    print_status "Dependencies installed ✅"
}

# Run tests
run_tests() {
    print_status "Running tests..."
    npm run test:ci
    print_status "Tests passed ✅"
}

# Run linting
run_linting() {
    print_status "Running linting..."
    npm run lint
    print_status "Linting passed ✅"
}

# Build application
build_application() {
    print_status "Building application for $ENVIRONMENT..."
    
    if [[ "$ENVIRONMENT" == "production" ]]; then
        npm run build:prod
    else
        npm run build
    fi
    
    print_status "Build completed ✅"
}

# Deploy to Netlify
deploy_netlify() {
    print_status "Deploying to Netlify..."
    
    if ! command -v netlify &> /dev/null; then
        print_warning "Netlify CLI not found. Installing..."
        npm install -g netlify-cli
    fi
    
    if [[ "$ENVIRONMENT" == "production" ]]; then
        netlify deploy --prod --dir=dist/resturent
    else
        netlify deploy --dir=dist/resturent
    fi
    
    print_status "Netlify deployment completed ✅"
}

# Deploy to Firebase
deploy_firebase() {
    print_status "Deploying to Firebase..."
    
    if ! command -v firebase &> /dev/null; then
        print_warning "Firebase CLI not found. Installing..."
        npm install -g firebase-tools
    fi
    
    firebase deploy --only hosting
    print_status "Firebase deployment completed ✅"
}

# Deploy to Vercel
deploy_vercel() {
    print_status "Deploying to Vercel..."
    
    if ! command -v vercel &> /dev/null; then
        print_warning "Vercel CLI not found. Installing..."
        npm install -g vercel
    fi
    
    if [[ "$ENVIRONMENT" == "production" ]]; then
        vercel --prod
    else
        vercel
    fi
    
    print_status "Vercel deployment completed ✅"
}

# Deploy Docker image
deploy_docker() {
    print_status "Building and deploying Docker image..."
    
    if ! command -v docker &> /dev/null; then
        print_error "Docker is not installed"
        return 1
    fi
    
    # Build Docker image
    docker build -t $PROJECT_NAME:$ENVIRONMENT .
    
    # Tag for registry
    docker tag $PROJECT_NAME:$ENVIRONMENT ghcr.io/mostafa-said7/$PROJECT_NAME:$ENVIRONMENT
    
    # Push to registry (requires authentication)
    if docker push ghcr.io/mostafa-said7/$PROJECT_NAME:$ENVIRONMENT; then
        print_status "Docker deployment completed ✅"
    else
        print_warning "Docker push failed. Make sure you're authenticated with the registry."
    fi
}

# Main deployment function
main() {
    print_status "🎯 Deploying Bella Restaurant to $ENVIRONMENT environment"
    
    check_dependencies
    install_dependencies
    run_tests
    run_linting
    build_application
    
    # Ask user which deployment method to use
    echo ""
    echo "Select deployment method:"
    echo "1) Netlify"
    echo "2) Firebase"
    echo "3) Vercel"
    echo "4) Docker"
    echo "5) All platforms"
    echo ""
    read -p "Enter your choice (1-5): " choice
    
    case $choice in
        1)
            deploy_netlify
            ;;
        2)
            deploy_firebase
            ;;
        3)
            deploy_vercel
            ;;
        4)
            deploy_docker
            ;;
        5)
            deploy_netlify
            deploy_firebase
            deploy_vercel
            deploy_docker
            ;;
        *)
            print_error "Invalid choice"
            exit 1
            ;;
    esac
    
    print_status "🎉 Deployment to $ENVIRONMENT completed successfully!"
    
    # Show deployment URLs
    echo ""
    echo "📱 Your application is now available at:"
    echo "   • Netlify: https://bella-restaurant-$ENVIRONMENT.netlify.app"
    echo "   • Firebase: https://$PROJECT_NAME-$ENVIRONMENT.web.app"
    echo "   • Vercel: https://$PROJECT_NAME-$ENVIRONMENT.vercel.app"
    echo "   • GitHub Pages: https://mostafa-said7.github.io/Bella/"
}

# Run main function
main