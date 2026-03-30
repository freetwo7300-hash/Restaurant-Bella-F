# Technologies & Stack

Complete overview of technologies and tools used in the Bella Restaurant project.

## Table of Contents

- [Frontend Framework](#frontend-framework)
- [State Management](#state-management)
- [UI Components](#ui-components)
- [Styling](#styling)
- [HTTP Client](#http-client)
- [Build Tools](#build-tools)
- [Testing](#testing)
- [Code Quality](#code-quality)
- [Development Tools](#development-tools)
- [Deployment](#deployment)
- [Version Information](#version-information)

## Frontend Framework

### Angular 19

**Version**: 19.2.0

Angular is a comprehensive TypeScript-based framework for building web applications.

**Key Features**:
- Standalone components
- Reactive programming with RxJS
- Dependency injection
- Built-in routing
- Form handling (Reactive & Template-driven)
- HTTP client
- Testing utilities

**Documentation**: https://angular.io/

**Installation**:
```bash
npm install @angular/core @angular/common @angular/router
```

**Usage**:
```typescript
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule],
  template: `<h1>{{ title }}</h1>`
})
export class AppComponent {
  title = 'Bella Restaurant';
}
```

## State Management

### NgRx

**Version**: 19.2.1

NgRx is a reactive state management library for Angular applications.

**Key Features**:
- Centralized store
- Actions for events
- Reducers for state changes
- Effects for side effects
- Selectors for data retrieval
- DevTools integration

**Packages**:
- `@ngrx/store`: Core store
- `@ngrx/effects`: Side effects management
- `@ngrx/store-devtools`: Redux DevTools integration

**Documentation**: https://ngrx.io/

**Installation**:
```bash
npm install @ngrx/store @ngrx/effects @ngrx/store-devtools
```

**Usage**:
```typescript
// Actions
export const loadRestaurants = createAction(
  '[Restaurant] Load Restaurants'
);

// Reducer
export const restaurantReducer = createReducer(
  initialState,
  on(loadRestaurants, (state) => ({ ...state, loading: true }))
);

// Effects
@Injectable()
export class RestaurantEffects {
  loadRestaurants$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loadRestaurants),
      switchMap(() => this.api.getRestaurants())
    )
  );
}

// Selectors
export const selectRestaurants = createSelector(
  selectRestaurantState,
  (state) => state.restaurants
);
```

## UI Components

### PrimeNG

**Version**: 19.1.4

PrimeNG is a rich set of open-source UI components for Angular.

**Key Components Used**:
- **DataView**: Menu display with pagination
- **Calendar**: Date selection for bookings
- **InputText**: Form inputs
- **Button**: Action buttons
- **Card**: Content containers
- **Dialog**: Modal dialogs
- **Dropdown**: Select options
- **Toast**: Notifications

**Documentation**: https://primeng.org/

**Installation**:
```bash
npm install primeng primeicons
```

**Usage**:
```typescript
import { DataViewModule } from 'primeng/dataview';
import { CalendarModule } from 'primeng/calendar';

@Component({
  imports: [DataViewModule, CalendarModule],
  template: `
    <p-dataView [value]="menuItems">
      <ng-template let-item pTemplate="listItem">
        {{ item.name }}
      </ng-template>
    </p-dataView>
  `
})
export class MenuComponent {}
```

### Lucide Angular

**Version**: 0.577.0

Lucide Angular provides beautiful, consistent SVG icons.

**Installation**:
```bash
npm install lucide-angular
```

**Usage**:
```typescript
import { LucideAngularModule, Menu, X } from 'lucide-angular';

@Component({
  imports: [LucideAngularModule],
  template: `<lucide-icon name="menu"></lucide-icon>`
})
export class NavbarComponent {}
```

## Styling

### Tailwind CSS

**Version**: 3.4.1

Tailwind CSS is a utility-first CSS framework.

**Features**:
- Utility classes
- Responsive design
- Dark mode support
- Customizable theme
- PurgeCSS for optimization

**Configuration**: `tailwind.config.js`

**Installation**:
```bash
npm install -D tailwindcss postcss autoprefixer
```

**Usage**:
```html
<div class="flex justify-center items-center gap-4 p-4">
  <button class="bg-primary hover:bg-secondary transition">
    Click me
  </button>
</div>
```

### PostCSS

**Version**: 8.4.31

PostCSS is a tool for transforming CSS with JavaScript plugins.

**Plugins**:
- Tailwind CSS
- Autoprefixer

**Configuration**: `postcss.config.js`

### Autoprefixer

**Version**: 10.4.16

Autoprefixer automatically adds vendor prefixes to CSS.

## HTTP Client

### Axios

**Version**: 1.13.6

Axios is a promise-based HTTP client for JavaScript.

**Features**:
- Promise-based API
- Request/response interceptors
- Timeout support
- Request cancellation
- Automatic JSON transformation

**Installation**:
```bash
npm install axios
```

**Usage**:
```typescript
import axios from 'axios';

export class ApiService {
  private api = axios.create({
    baseURL: 'https://api.example.com',
    timeout: 30000
  });

  getRestaurants() {
    return from(this.api.get('/restaurants'));
  }
}
```

## Build Tools

### Angular CLI

**Version**: 19.2.22

Angular CLI is the command-line interface for Angular.

**Commands**:
```bash
ng serve              # Start dev server
ng build              # Build application
ng test               # Run tests
ng lint               # Run linter
ng generate           # Generate components
```

### TypeScript

**Version**: 5.7.2

TypeScript is a typed superset of JavaScript.

**Configuration**: `tsconfig.json`

**Features**:
- Static typing
- Interfaces
- Decorators
- Generics
- Enums

### Webpack

Webpack is bundled with Angular CLI for module bundling.

**Features**:
- Code splitting
- Tree shaking
- Asset optimization
- Development server

## Testing

### Jasmine

**Version**: 5.6.0

Jasmine is a behavior-driven testing framework.

**Features**:
- Test suites and specs
- Assertions
- Spies and mocks
- Async testing

**Usage**:
```typescript
describe('MenuComponent', () => {
  it('should display menu items', () => {
    expect(component.menuItems.length).toBeGreaterThan(0);
  });
});
```

### Karma

**Version**: 6.4.0

Karma is a test runner for JavaScript.

**Configuration**: `karma.conf.js`

**Commands**:
```bash
npm test              # Run tests
npm run test:ci       # Run tests in CI mode
```

### Chrome Headless

Used for running tests in CI environments without a display.

## Code Quality

### ESLint

**Version**: 8.57.0

ESLint is a JavaScript linter for identifying and fixing code issues.

**Configuration**: `.eslintrc.json`

**Plugins**:
- `@angular-eslint/eslint-plugin`
- `@typescript-eslint/eslint-plugin`

**Commands**:
```bash
npm run lint          # Run linter
npm run lint:fix      # Fix issues
```

### Prettier

**Version**: 3.0.0

Prettier is an opinionated code formatter.

**Configuration**: `.prettierrc`

**Commands**:
```bash
npm run format        # Format code
npm run format:check  # Check formatting
```

### TypeScript Compiler

Provides type checking and compilation.

**Commands**:
```bash
npx tsc --noEmit      # Type check without emitting
```

## Development Tools

### Node.js

**Supported Versions**: 18.x, 20.x LTS

Node.js is a JavaScript runtime.

**Installation**: https://nodejs.org/

### npm

**Version**: 9.x or higher

npm is the Node.js package manager.

**Commands**:
```bash
npm install           # Install dependencies
npm update            # Update packages
npm audit             # Check vulnerabilities
npm audit fix         # Fix vulnerabilities
```

### Visual Studio Code

Recommended IDE with extensions:
- Angular Language Service
- ESLint
- Prettier
- Thunder Client
- GitLens

### Git

Version control system.

**Installation**: https://git-scm.com/

## Deployment

### Docker

**Features**:
- Containerization
- Multi-stage builds
- Environment configuration
- Health checks

**Dockerfile**: `Dockerfile`

**Commands**:
```bash
docker build -t bella-restaurant .
docker run -p 80:80 bella-restaurant
```

### Docker Compose

**Version**: Defined in `docker-compose.yml`

**Services**:
- Web application
- Nginx reverse proxy

### Nginx

Web server and reverse proxy.

**Configuration**: `config/deployment/nginx.conf`

## CI/CD

### GitHub Actions

Automated workflows for:
- Testing
- Building
- Security scanning
- Deployment

**Workflows**: `.github/workflows/`

### Dependabot

Automated dependency updates.

**Configuration**: `.github/dependabot.yml`

## Version Information

### Package Versions

```json
{
  "dependencies": {
    "@angular/core": "^19.2.0",
    "@ngrx/store": "^19.2.1",
    "primeng": "^19.1.4",
    "axios": "^1.13.6",
    "tailwindcss": "^3.4.1"
  },
  "devDependencies": {
    "@angular/cli": "^19.2.22",
    "typescript": "~5.7.2",
    "eslint": "^8.57.0",
    "prettier": "^3.0.0",
    "jasmine-core": "~5.6.0",
    "karma": "~6.4.0"
  }
}
```

## Technology Decisions

### Why Angular?

- Comprehensive framework
- Strong typing with TypeScript
- Built-in features (routing, forms, HTTP)
- Large community and ecosystem
- Enterprise-ready

### Why NgRx?

- Predictable state management
- Time-travel debugging
- Scalable architecture
- Clear separation of concerns

### Why Tailwind CSS?

- Utility-first approach
- Rapid development
- Consistent design system
- Excellent performance
- Easy customization

### Why PrimeNG?

- Rich component library
- Professional UI components
- Accessibility support
- Active maintenance
- Good documentation

## Upgrade Path

### Angular Upgrades

```bash
# Check for updates
ng update @angular/cli @angular/core

# Perform upgrade
ng update @angular/cli @angular/core --allow-dirty
```

### Dependency Updates

```bash
# Check outdated packages
npm outdated

# Update packages
npm update

# Update specific package
npm install package-name@latest
```

## Resources

- [Angular Documentation](https://angular.io/docs)
- [NgRx Documentation](https://ngrx.io/docs)
- [PrimeNG Components](https://primeng.org/)
- [Tailwind CSS](https://tailwindcss.com/docs)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)
- [Axios Documentation](https://axios-http.com/docs/intro)

---

Last updated: March 2026
