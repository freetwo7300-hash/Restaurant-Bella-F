# Bella Restaurant - Modern Dining Experience

A premium restaurant landing page built with **Angular 19**, featuring modern architecture and high-performance state management.

## 🚀 Tech Stack
- **Framework**: [Angular 19](https://angular.io/) (Standalone)
- **State Management**: [NgRx](https://ngrx.io/) (Store, Effects)
- **HTTP Client**: [Axios](https://axios-http.com/)
- **UI Components**: [PrimeNG](https://primeng.org/)
- **Styling**: [Tailwind CSS](https://tailwindcss.com/)
- **Icons**: [Lucide Angular](https://lucide.dev/)

## 🏗️ Architecture
The project follows a modular **Core/Shared/Features/Layout** pattern:
- `core/`: Singleton services, models, and global state.
- `shared/`: Reusable components, pipes, and directives.
- `features/`: Business logic and specific feature components (Home, Menu, Booking).
- `layout/`: Main application structure components.

## 🛠️ Getting Started
1. Clone the repository.
2. Run `npm install`.
3. Start the dev server with `npm start`.
4. Open `http://localhost:4200` in your browser.

## 📄 Documentation
Check the `docs/` folder for design patterns and architecture details.
Screenshots of the UI can be found in the `screenshots/` folder.

## 🤖 CI/CD
Automated builds and tests are handled via GitHub Actions.
