# Contributing to Bella Restaurant

Thank you for your interest in contributing to Bella Restaurant! This document provides guidelines and instructions for contributing to the project.

## Table of Contents

- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Making Changes](#making-changes)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Process](#pull-request-process)
- [Coding Standards](#coding-standards)
- [Testing](#testing)
- [Documentation](#documentation)

## Getting Started

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/Mostafa-SAID7/Bella.git
   cd Bella
   ```
3. Add upstream remote:
   ```bash
   git remote add upstream https://github.com/Mostafa-SAID7/Bella.git
   ```

## Development Setup

### Prerequisites

- Node.js 18.x or 20.x
- npm 9.x or higher
- Git

### Installation

```bash
# Install dependencies
npm install

# Start development server
npm start

# Application will be available at http://localhost:4200
```

### Available Scripts

```bash
npm start              # Start development server
npm run build          # Build for development
npm run build:prod     # Build for production
npm test              # Run unit tests
npm run test:ci       # Run tests in CI mode
npm run lint          # Run ESLint
npm run lint:fix      # Fix linting issues
npm run format        # Format code with Prettier
npm run format:check  # Check formatting
npm run e2e           # Run E2E tests
npm run analyze       # Analyze bundle size
```

## Making Changes

### Create a Feature Branch

```bash
git checkout -b feature/your-feature-name
```

Branch naming conventions:
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation updates
- `refactor/` - Code refactoring
- `test/` - Test additions
- `chore/` - Maintenance tasks

### Code Style

#### TypeScript

- Use strict typing
- Avoid `any` type
- Use meaningful variable names
- Add JSDoc comments for public APIs

```typescript
/**
 * Fetches restaurant data from the API
 * @param id - Restaurant ID
 * @returns Observable of restaurant data
 */
fetchRestaurant(id: string): Observable<Restaurant> {
  return this.http.get<Restaurant>(`/api/restaurants/${id}`);
}
```

#### Angular Components

- Use standalone components
- Implement OnDestroy for cleanup
- Use reactive forms
- Use OnPush change detection when possible

```typescript
@Component({
  selector: 'app-menu',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  changeDetection: ChangeDetectionStrategy.OnPush,
  template: `...`
})
export class MenuComponent implements OnDestroy {
  // Implementation
}
```

#### HTML Templates

- Use semantic HTML
- Add ARIA labels for accessibility
- Use Angular directives properly
- Keep templates clean and readable

#### CSS/SCSS

- Use Tailwind CSS for utilities
- Keep component styles scoped
- Use CSS variables for theming
- Follow BEM naming for custom styles

### Formatting

Before committing, format your code:

```bash
npm run format
```

### Linting

Ensure your code passes linting:

```bash
npm run lint
```

Fix issues automatically:

```bash
npm run lint:fix
```

## Commit Guidelines

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Type

- `feat` - A new feature
- `fix` - A bug fix
- `docs` - Documentation only changes
- `style` - Changes that don't affect code meaning (formatting, etc.)
- `refactor` - Code change that neither fixes a bug nor adds a feature
- `perf` - Code change that improves performance
- `test` - Adding missing tests or correcting existing tests
- `chore` - Changes to build process, dependencies, etc.

### Scope

The scope specifies what part of the codebase is affected:
- `core` - Core services and state
- `features` - Feature modules
- `shared` - Shared components
- `ui` - UI components
- `api` - API integration
- `build` - Build configuration

### Subject

- Use imperative mood ("add" not "added" or "adds")
- Don't capitalize first letter
- No period (.) at the end
- Limit to 50 characters

### Body

- Explain what and why, not how
- Wrap at 72 characters
- Separate from subject with blank line

### Footer

- Reference issues: `Fixes #123`
- Reference related issues: `Related to #456`

### Examples

```
feat(menu): add filtering by cuisine type

Add ability to filter restaurant menu items by cuisine type.
Implements dropdown selector and updates state accordingly.

Fixes #123
```

```
fix(booking): resolve calendar date selection issue

Calendar was not properly updating selected date in form.
Added proper change detection and form value updates.

Fixes #456
Related to #789
```

## Pull Request Process

### Before Creating a PR

1. Update your branch with latest main:
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

2. Run all checks locally:
   ```bash
   npm run lint
   npm run format:check
   npm run test:ci
   npm run build:prod
   ```

3. Push your changes:
   ```bash
   git push origin feature/your-feature-name
   ```

### Creating a PR

1. Go to GitHub and create a Pull Request
2. Fill out the PR template completely
3. Link related issues
4. Request reviewers
5. Ensure all CI checks pass

### PR Requirements

- [ ] Code follows style guidelines
- [ ] Tests are included and passing
- [ ] Documentation is updated
- [ ] No breaking changes (or clearly documented)
- [ ] Commit messages are clear
- [ ] No merge conflicts

### Review Process

- Address all feedback
- Push additional commits (don't force push)
- Re-request review after changes
- Be respectful and professional

## Coding Standards

### Project Structure

```
src/
├── app/
│   ├── core/
│   │   ├── models/          # Data models
│   │   ├── services/        # Core services
│   │   └── state/           # NgRx state management
│   ├── features/            # Feature modules
│   ├── shared/              # Shared components
│   └── app.component.ts     # Root component
├── assets/                  # Static assets
└── styles/                  # Global styles
```

### Naming Conventions

- Components: `PascalCase` (e.g., `MenuComponent`)
- Services: `PascalCase` with `Service` suffix (e.g., `RestaurantService`)
- Files: `kebab-case` (e.g., `menu.component.ts`)
- Constants: `UPPER_SNAKE_CASE` (e.g., `API_BASE_URL`)
- Variables: `camelCase` (e.g., `restaurantList`)

### Import Organization

```typescript
// 1. Angular imports
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

// 2. Third-party imports
import { Store } from '@ngrx/store';

// 3. Local imports
import { RestaurantService } from '@core/services';
import { selectRestaurants } from '@core/state';
```

## Testing

### Unit Tests

- Write tests for all new features
- Maintain or improve code coverage
- Use descriptive test names

```typescript
describe('RestaurantService', () => {
  let service: RestaurantService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(RestaurantService);
  });

  it('should fetch restaurants', (done) => {
    service.getRestaurants().subscribe((restaurants) => {
      expect(restaurants.length).toBeGreaterThan(0);
      done();
    });
  });
});
```

### Running Tests

```bash
# Run all tests
npm test

# Run tests in CI mode
npm run test:ci

# Run tests with coverage
npm run test:ci
```

## Documentation

### Update Documentation

- Update README.md for significant changes
- Add JSDoc comments for public APIs
- Update architecture.md if structure changes
- Include examples for new features

### Documentation Standards

- Use clear, concise language
- Include code examples
- Add diagrams for complex concepts
- Keep documentation up-to-date

## Questions?

- Check existing issues and discussions
- Review documentation in `/docs`
- Ask in pull request comments
- Open a discussion for major questions

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.

Thank you for contributing to Bella Restaurant!
