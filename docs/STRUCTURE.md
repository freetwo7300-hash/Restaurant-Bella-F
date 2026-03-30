# Project Structure

Comprehensive guide to the Bella Restaurant project structure and organization.

## Directory Overview

```
resturent/
├── .github/                    # GitHub configuration
│   ├── workflows/              # CI/CD workflows
│   ├── ISSUE_TEMPLATE/         # Issue templates
│   ├── CONTRIBUTING.md         # Contribution guidelines
│   ├── PULL_REQUEST_TEMPLATE.md # PR template
│   ├── SECURITY.md            # Security policy
│   ├── CODEOWNERS             # Code ownership
│   └── dependabot.yml         # Dependency management
├── .angular/                   # Angular build cache
├── config/                     # Configuration files
│   ├── deployment/             # Deployment configs
│   │   ├── docker-compose.yml
│   │   ├── Dockerfile
│   │   ├── netlify.toml
│   │   └── nginx.conf
│   └── quality/                # Quality configs
│       └── lighthouserc.json
├── docs/                       # Documentation
│   ├── CHANGELOG.md           # Version history
│   ├── CODE_OF_CONDUCT.md     # Community guidelines
│   ├── CONTRIBUTING.md        # Contribution guide
│   ├── FEATURES.md            # Feature list
│   ├── SECURITY.md            # Security policy
│   ├── STRUCTURE.md           # This file
│   ├── PROJECT_SETUP.md       # Setup instructions
│   ├── STYLES.md              # Styling guide
│   ├── DEPLOYMENT.md          # Deployment guide
│   ├── TECHNOLOGIES.md        # Tech stack
│   ├── CONTRIBUTORS.md        # Contributors list
│   ├── USE_CASES.md           # Use cases
│   ├── ERD.md                 # Entity relationship diagram
│   ├── architecture.md        # Architecture guide
│   └── CI-CD-README.md        # CI/CD documentation
├── dist/                       # Build output
├── node_modules/               # Dependencies
├── public/                     # Static assets
│   ├── assets/                 # Images and media
│   ├── data/                   # Static data
│   ├── favicon.ico
│   └── favicon.svg
├── scripts/                    # Utility scripts
│   └── deploy.sh              # Deployment script
├── src/                        # Source code
│   ├── app/                    # Application code
│   │   ├── core/               # Core functionality
│   │   │   ├── api.config.ts   # API configuration
│   │   │   ├── models/         # Data models
│   │   │   │   └── restaurant.model.ts
│   │   │   ├── services/       # Core services
│   │   │   │   └── api.service.ts
│   │   │   └── state/          # NgRx state
│   │   │       ├── restaurant.actions.ts
│   │   │       ├── restaurant.effects.ts
│   │   │       ├── restaurant.reducer.ts
│   │   │       └── restaurant.selectors.ts
│   │   ├── features/           # Feature modules
│   │   │   ├── booking/        # Booking feature
│   │   │   │   ├── booking.component.ts
│   │   │   │   └── booking.component.spec.ts
│   │   │   ├── chef/           # Chef feature
│   │   │   │   └── chef.component.ts
│   │   │   ├── home/           # Home feature
│   │   │   │   ├── components/ # Home sub-components
│   │   │   │   │   ├── about.component.ts
│   │   │   │   │   ├── booking.component.ts
│   │   │   │   │   ├── chef.component.ts
│   │   │   │   │   ├── featured-menu.component.ts
│   │   │   │   │   ├── features.component.ts
│   │   │   │   │   ├── footer.component.ts
│   │   │   │   │   ├── hero.component.ts
│   │   │   │   │   ├── menu.component.ts
│   │   │   │   │   ├── navbar.component.ts
│   │   │   │   │   ├── reservation.component.ts
│   │   │   │   │   ├── reviews.component.ts
│   │   │   │   │   ├── story.component.ts
│   │   │   │   │   └── testimonials.component.ts
│   │   │   │   └── home.component.ts
│   │   │   ├── menu/           # Menu feature
│   │   │   │   └── menu.component.ts
│   │   │   ├── reservation/    # Reservation feature
│   │   │   │   └── reservation.component.ts
│   │   │   └── story/          # Story feature
│   │   │       └── story.component.ts
│   │   ├── shared/             # Shared components
│   │   │   ├── components/     # Reusable components
│   │   │   ├── directives/     # Custom directives
│   │   │   ├── pipes/          # Custom pipes
│   │   │   └── utils/          # Utility functions
│   │   ├── app.component.ts    # Root component
│   │   ├── app.component.spec.ts
│   │   ├── app.config.ts       # App configuration
│   │   └── app.routes.ts       # Route definitions
│   ├── assets/                 # Static assets
│   │   └── images/             # Image files
│   ├── styles/                 # Global styles
│   │   ├── global.css
│   │   ├── variables.css
│   │   └── tailwind.css
│   ├── main.ts                 # Application entry point
│   └── index.html              # HTML template
├── .editorconfig               # Editor configuration
├── .eslintrc.json              # ESLint configuration
├── .gitignore                  # Git ignore rules
├── .prettierrc                 # Prettier configuration
├── angular.json                # Angular configuration
├── firebase.json               # Firebase configuration
├── package.json                # Dependencies and scripts
├── package-lock.json           # Dependency lock file
├── README.md                   # Project README
├── sonar-project.properties    # SonarQube configuration
└── tsconfig.json               # TypeScript configuration
```

## Core Directory Details

### `/src/app/core`

Core functionality shared across the application:

- **api.config.ts**: API endpoint configuration
- **models/**: TypeScript interfaces and types
- **services/**: Core services (API, authentication, etc.)
- **state/**: NgRx store, actions, effects, reducers, selectors

### `/src/app/features`

Feature modules organized by business domain:

- **booking/**: Reservation booking functionality
- **chef/**: Chef profiles and information
- **home/**: Landing page and main sections
- **menu/**: Restaurant menu display
- **reservation/**: Reservation management
- **story/**: Restaurant history and stories

### `/src/app/shared`

Reusable components and utilities:

- **components/**: Shared UI components
- **directives/**: Custom Angular directives
- **pipes/**: Custom pipes for data transformation
- **utils/**: Helper functions and utilities

### `/config`

Configuration files for deployment and quality:

- **deployment/**: Docker, Nginx, Netlify configs
- **quality/**: Lighthouse and quality tool configs

### `/docs`

Comprehensive documentation:

- Architecture and design decisions
- Setup and deployment guides
- Contributing guidelines
- API documentation
- Troubleshooting guides

### `/scripts`

Utility scripts for development and deployment:

- Deployment automation
- Build scripts
- Database migrations
- Maintenance tasks

## File Naming Conventions

### Components

```
component-name.component.ts       # Component class
component-name.component.html     # Template
component-name.component.css      # Styles
component-name.component.spec.ts  # Tests
```

### Services

```
service-name.service.ts           # Service class
service-name.service.spec.ts      # Tests
```

### Models

```
model-name.model.ts               # Type definitions
```

### State Management

```
feature.actions.ts                # Actions
feature.reducer.ts                # Reducer
feature.effects.ts                # Effects
feature.selectors.ts              # Selectors
```

## Module Organization

### Standalone Components

All components are standalone (Angular 14+):

```typescript
@Component({
  selector: 'app-menu',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  template: `...`
})
export class MenuComponent {}
```

### Feature Modules

Features are organized as standalone components with related services:

```
features/
├── menu/
│   ├── menu.component.ts
│   ├── menu.component.html
│   ├── menu.component.css
│   ├── menu.component.spec.ts
│   └── menu.service.ts
```

## State Management Structure

### NgRx Store

```
store/
├── restaurant/
│   ├── restaurant.actions.ts
│   ├── restaurant.reducer.ts
│   ├── restaurant.effects.ts
│   └── restaurant.selectors.ts
```

### Actions

```typescript
export const loadRestaurants = createAction(
  '[Restaurant] Load Restaurants'
);
```

### Selectors

```typescript
export const selectRestaurants = createSelector(
  selectRestaurantState,
  (state) => state.restaurants
);
```

## Routing Structure

Routes defined in `app.routes.ts`:

```typescript
export const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'menu', component: MenuComponent },
  { path: 'booking', component: BookingComponent },
  { path: 'chef', component: ChefComponent },
  { path: 'story', component: StoryComponent },
];
```

## Asset Organization

### Images

```
public/assets/images/
├── hero/
├── menu/
├── chef/
├── testimonials/
└── icons/
```

### Data

```
public/data/
├── db.json              # Mock data
├── restaurants.json
├── menu-items.json
└── chefs.json
```

## Configuration Files

### TypeScript

- **tsconfig.json**: TypeScript compiler options
- **tsconfig.app.json**: App-specific config
- **tsconfig.spec.json**: Test-specific config

### Angular

- **angular.json**: Angular CLI configuration
- **app.config.ts**: Application configuration
- **app.routes.ts**: Route definitions

### Linting & Formatting

- **.eslintrc.json**: ESLint rules
- **.prettierrc**: Prettier formatting
- **.editorconfig**: Editor settings

### Build & Deployment

- **Dockerfile**: Docker image definition
- **docker-compose.yml**: Multi-container setup
- **nginx.conf**: Nginx configuration
- **netlify.toml**: Netlify deployment config

## Build Output

### Distribution

```
dist/
└── resturent/
    ├── index.html
    ├── main.js
    ├── styles.css
    ├── assets/
    └── ...
```

## Development Workflow

1. **Create feature branch** from `develop`
2. **Make changes** in appropriate directories
3. **Run tests** and linting
4. **Commit changes** with clear messages
5. **Create pull request** to `develop`
6. **Code review** and merge
7. **Deploy** to staging/production

## Best Practices

- Keep components focused and single-responsibility
- Use shared components for reusable UI
- Organize features by business domain
- Keep state management centralized
- Use strong typing throughout
- Write tests for critical functionality
- Document complex logic
- Follow naming conventions consistently

## Related Documentation

- [CONTRIBUTING.md](CONTRIBUTING.md) - Contribution guidelines
- [architecture.md](architecture.md) - Architecture decisions
- [PROJECT_SETUP.md](PROJECT_SETUP.md) - Setup instructions
- [DEPLOYMENT.md](DEPLOYMENT.md) - Deployment guide
