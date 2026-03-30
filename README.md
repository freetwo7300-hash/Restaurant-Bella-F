# Bella Restaurant - Modern Dining Experience

A premium restaurant landing page built with **Angular 19**, featuring modern architecture, high-performance state management, and comprehensive documentation.

## 🚀 Quick Start

```bash
# Clone repository
git clone https://github.com/your-org/resturent.git
cd resturent

# Install dependencies
npm install

# Start development server
npm start

# Open http://localhost:4200
```

For detailed setup instructions, see [PROJECT_SETUP.md](docs/PROJECT_SETUP.md).

## 📚 Documentation

### Getting Started
- **[PROJECT_SETUP.md](docs/PROJECT_SETUP.md)** - Complete development environment setup
- **[STRUCTURE.md](docs/STRUCTURE.md)** - Project organization and file structure
- **[TECHNOLOGIES.md](docs/TECHNOLOGIES.md)** - Tech stack and dependencies

### Development
- **[CONTRIBUTING.md](docs/CONTRIBUTING.md)** - Contribution guidelines and workflow
- **[STYLES.md](docs/STYLES.md)** - Styling guide and CSS conventions
- **[architecture.md](docs/architecture.md)** - Application architecture and design patterns

### Features & Design
- **[FEATURES.md](docs/FEATURES.md)** - Feature list and capabilities
- **[USE_CASES.md](docs/USE_CASES.md)** - User personas and scenarios
- **[ERD.md](docs/ERD.md)** - Entity relationship diagram and data model

### Deployment & Operations
- **[DEPLOYMENT.md](docs/DEPLOYMENT.md)** - Deployment guide for all platforms
- **[CI-CD-README.md](docs/CI-CD-README.md)** - CI/CD pipeline documentation
- **[SECURITY.md](docs/SECURITY.md)** - Security policies and best practices

### Community & Governance
- **[CONDUCT.md](docs/CONDUCT.md)** - Code of conduct
- **[CONTRIBUTORS.md](docs/CONTRIBUTORS.md)** - Contributors list
- **[CHANGELOG.md](docs/CHANGELOG.md)** - Version history and releases

**[📖 View All Documentation](docs/INDEX.md)** - Complete documentation index

## 🏗️ Architecture

The project follows a modular **Core/Shared/Features** pattern:

- **`core/`** - Singleton services, models, and global state (NgRx)
- **`shared/`** - Reusable components, pipes, and directives
- **`features/`** - Business logic and feature components (Home, Menu, Booking, Chef, Story)

See [architecture.md](docs/architecture.md) for detailed architecture documentation.

## 🚀 Tech Stack

| Technology | Version | Purpose |
|-----------|---------|---------|
| [Angular](https://angular.io/) | 19.2.0 | Frontend framework |
| [NgRx](https://ngrx.io/) | 19.2.1 | State management |
| [PrimeNG](https://primeng.org/) | 19.1.4 | UI components |
| [Tailwind CSS](https://tailwindcss.com/) | 3.4.1 | Styling |
| [Axios](https://axios-http.com/) | 1.13.6 | HTTP client |
| [TypeScript](https://www.typescriptlang.org/) | 5.7.2 | Language |

See [TECHNOLOGIES.md](docs/TECHNOLOGIES.md) for complete tech stack details.

## 📁 Project Structure

```
resturent/
├── .github/                    # GitHub configuration
│   ├── workflows/              # CI/CD workflows
│   ├── ISSUE_TEMPLATE/         # Issue templates
│   └── CONTRIBUTING.md         # Contribution guidelines
├── config/                     # Configuration files
│   ├── deployment/             # Docker, Nginx, Netlify configs
│   └── quality/                # Lighthouse and quality configs
├── docs/                       # Comprehensive documentation
│   ├── INDEX.md               # Documentation index
│   ├── PROJECT_SETUP.md       # Setup guide
│   ├── STRUCTURE.md           # Project structure
│   ├── TECHNOLOGIES.md        # Tech stack
│   ├── CONTRIBUTING.md        # Contribution guide
│   ├── STYLES.md              # Styling guide
│   ├── architecture.md        # Architecture
│   ├── FEATURES.md            # Features
│   ├── USE_CASES.md           # Use cases
│   ├── ERD.md                 # Data model
│   ├── DEPLOYMENT.md          # Deployment guide
│   ├── CI-CD-README.md        # CI/CD documentation
│   ├── SECURITY.md            # Security policy
│   ├── CONDUCT.md             # Code of conduct
│   ├── CONTRIBUTORS.md        # Contributors
│   └── CHANGELOG.md           # Version history
├── public/                     # Static assets
│   ├── assets/                # Images and media
│   └── data/                  # Static data
├── scripts/                    # Utility scripts
├── src/                        # Source code
│   ├── app/
│   │   ├── core/              # Core services and state
│   │   ├── features/          # Feature modules
│   │   ├── shared/            # Shared components
│   │   └── app.routes.ts      # Route definitions
│   ├── assets/                # Application assets
│   └── styles/                # Global styles
├── package.json               # Dependencies
├── angular.json               # Angular configuration
├── tsconfig.json              # TypeScript configuration
└── README.md                  # This file
```

See [STRUCTURE.md](docs/STRUCTURE.md) for detailed project structure documentation.

## 🎯 Features

- **Restaurant Menu Display** - Dynamic menu with filtering and search
- **Booking System** - Interactive calendar and reservation form
- **Chef Profiles** - Chef information and signature dishes
- **Restaurant Stories** - History and team information
- **Responsive Design** - Mobile-first, fully responsive
- **State Management** - NgRx for predictable state
- **Performance Optimized** - Lazy loading, tree-shaking, code splitting
- **Security** - CSP, security headers, input validation
- **Multi-Platform Deployment** - GitHub Pages, Netlify, Vercel, AWS, Firebase, Docker

See [FEATURES.md](docs/FEATURES.md) for complete feature list.

## 🛠️ Available Scripts

```bash
# Development
npm start                 # Start dev server (http://localhost:4200)
npm run build            # Build for development
npm run build:prod       # Build for production

# Testing
npm test                 # Run unit tests
npm run test:ci          # Run tests in CI mode
npm run e2e              # Run E2E tests

# Code Quality
npm run lint             # Run ESLint
npm run lint:fix         # Fix linting issues
npm run format           # Format code with Prettier
npm run format:check     # Check formatting

# Analysis
npm run analyze          # Analyze bundle size

# Docker
npm run docker:build     # Build Docker image
npm run docker:run       # Run Docker container
```

See [PROJECT_SETUP.md](docs/PROJECT_SETUP.md) for detailed command documentation.

## 🚀 Deployment

The application can be deployed to multiple platforms:

- **GitHub Pages** - Free static hosting
- **Netlify** - Serverless with CI/CD
- **Vercel** - Optimized for static sites
- **AWS** - S3 + CloudFront
- **Firebase** - Google Cloud integration
- **Docker** - Containerized deployment

See [DEPLOYMENT.md](docs/DEPLOYMENT.md) for platform-specific deployment guides.

## 🔄 CI/CD Pipeline

Automated workflows handle:
- Testing on every push
- Code quality checks
- Security scanning
- Automated deployments
- Dependency updates

See [CI-CD-README.md](docs/CI-CD-README.md) for pipeline documentation.

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Read [CONDUCT.md](docs/CONDUCT.md) - Code of conduct
2. Follow [CONTRIBUTING.md](docs/CONTRIBUTING.md) - Contribution guidelines
3. Check [STYLES.md](docs/STYLES.md) - Code style guide
4. Review [STRUCTURE.md](docs/STRUCTURE.md) - Project structure

### Quick Contribution Steps

```bash
# 1. Fork and clone
git clone https://github.com/your-username/resturent.git

# 2. Create feature branch
git checkout -b feature/your-feature

# 3. Make changes and test
npm run lint
npm run format
npm test

# 4. Commit with clear message
git commit -m "feat: add your feature"

# 5. Push and create PR
git push origin feature/your-feature
```

## 🔒 Security

For security concerns, see [SECURITY.md](docs/SECURITY.md).

To report a vulnerability, email: security@example.com

## 📋 Requirements

- **Node.js**: 18.x or 20.x LTS
- **npm**: 9.x or higher
- **Git**: Latest version

See [PROJECT_SETUP.md](docs/PROJECT_SETUP.md) for detailed requirements.

## 📊 Project Status

- **Version**: 1.0.0
- **Status**: Active Development
- **Last Updated**: March 31, 2026

See [CHANGELOG.md](docs/CHANGELOG.md) for version history.

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/your-org/resturent/issues)
- **Discussions**: [GitHub Discussions](https://github.com/your-org/resturent/discussions)
- **Documentation**: [docs/INDEX.md](docs/INDEX.md)

## 📄 License

This project is licensed under the MIT License - see LICENSE file for details.

## 👥 Contributors

See [CONTRIBUTORS.md](docs/CONTRIBUTORS.md) for list of contributors.

---

**[📖 View Complete Documentation](docs/INDEX.md)** | **[🐛 Report Issue](https://github.com/your-org/resturent/issues)** | **[💬 Start Discussion](https://github.com/your-org/resturent/discussions)**
