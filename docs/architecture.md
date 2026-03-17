# Bella Restaurant Architecture Guide

## Core Concepts
This project implements a clean architecture for Angular 19, focusing on scalability and premium user experience.

### State Management (NgRx)
- **Global Store**: Managed in `core/state`.
- **Side Effects**: asynchronous data fetching using `RestaurantEffects`.
- **Selectors**: Optimized data retrieval with memoization in `restaurant.selectors.ts`.

### API & Interceptors (Axios)
- **Base Config**: Located in `core/api.config.ts`.
- **Service**: `ApiService` wraps Axios calls into RxJS Observables using `from()`.

### Layout System
- **Navbar**: Sticky backdrop-blur navigation with dynamic restaurant info.
- **Footer**: Comprehensive site information and social links.
- **Features**: Standalone components for modularity and performance.

### UI & Styling
- **Tailwind CSS**: Used for structural layout and custom premium styling.
- **PrimeNG**: Powers the data-heavy and interactive components:
  - `DataView`: For the restaurant menu with pagination.
  - `Calendar`, `InputText`: For the premium booking form.

## CI/CD Pipeline
GitHub Actions automatically:
1. Installs dependencies.
2. Runs the Angular build.
3. (Future) Deploys to staging/production.
