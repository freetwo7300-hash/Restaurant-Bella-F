# Styling Guide

Comprehensive guide to styling in the Bella Restaurant project.

## Table of Contents

- [Overview](#overview)
- [Tailwind CSS](#tailwind-css)
- [Component Styles](#component-styles)
- [Global Styles](#global-styles)
- [CSS Variables](#css-variables)
- [Responsive Design](#responsive-design)
- [Best Practices](#best-practices)
- [Theming](#theming)

## Overview

The project uses a combination of:

- **Tailwind CSS**: Utility-first CSS framework
- **Component Styles**: Scoped component CSS
- **Global Styles**: Application-wide styles
- **CSS Variables**: Theme customization

## Tailwind CSS

### Configuration

Tailwind configuration in `tailwind.config.js`:

```javascript
module.exports = {
  content: [
    './src/**/*.{html,ts}',
  ],
  theme: {
    extend: {
      colors: {
        primary: '#8B4513',
        secondary: '#D2691E',
        accent: '#FFD700',
      },
      fontFamily: {
        serif: ['Georgia', 'serif'],
        sans: ['Segoe UI', 'sans-serif'],
      },
    },
  },
  plugins: [],
};
```

### Utility Classes

Common Tailwind utilities used:

```html
<!-- Spacing -->
<div class="p-4 m-2 mb-8">Padding and margin</div>

<!-- Colors -->
<div class="bg-primary text-white">Background and text color</div>

<!-- Typography -->
<h1 class="text-3xl font-bold">Large bold heading</h1>

<!-- Flexbox -->
<div class="flex justify-center items-center gap-4">Flex layout</div>

<!-- Grid -->
<div class="grid grid-cols-3 gap-4">Grid layout</div>

<!-- Responsive -->
<div class="text-sm md:text-base lg:text-lg">Responsive text</div>

<!-- Hover States -->
<button class="bg-primary hover:bg-secondary transition">Button</button>
```

### Tailwind Directives

In global CSS files:

```css
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer components {
  .btn-primary {
    @apply px-4 py-2 bg-primary text-white rounded hover:bg-secondary transition;
  }
}
```

## Component Styles

### Scoped Styles

Each component has its own CSS file:

```typescript
@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.css'],
  encapsulation: ViewEncapsulation.Emulated
})
export class MenuComponent {}
```

### Component CSS Example

```css
/* menu.component.css */

.menu-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 2rem;
  padding: 2rem;
}

.menu-item {
  border-radius: 0.5rem;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.menu-item:hover {
  transform: translateY(-4px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
}

.menu-item-image {
  width: 100%;
  height: 200px;
  object-fit: cover;
  border-radius: 0.5rem 0.5rem 0 0;
}

.menu-item-content {
  padding: 1rem;
}

.menu-item-title {
  font-size: 1.25rem;
  font-weight: 600;
  margin-bottom: 0.5rem;
}

.menu-item-description {
  font-size: 0.875rem;
  color: #666;
  margin-bottom: 1rem;
}

.menu-item-price {
  font-size: 1.5rem;
  font-weight: 700;
  color: #8B4513;
}
```

### Using Tailwind in Components

```html
<!-- menu.component.html -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 p-8">
  <div *ngFor="let item of menuItems" 
       class="bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow">
    <img [src]="item.image" 
         alt="{{ item.name }}"
         class="w-full h-48 object-cover rounded-t-lg">
    <div class="p-4">
      <h3 class="text-xl font-semibold mb-2">{{ item.name }}</h3>
      <p class="text-gray-600 text-sm mb-4">{{ item.description }}</p>
      <p class="text-2xl font-bold text-primary">${{ item.price }}</p>
    </div>
  </div>
</div>
```

## Global Styles

### Global CSS File

`src/styles/global.css`:

```css
/* Reset and Base Styles */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
}

body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  line-height: 1.6;
  color: #333;
  background-color: #f9f9f9;
}

/* Typography */
h1, h2, h3, h4, h5, h6 {
  font-family: 'Georgia', serif;
  font-weight: 600;
  line-height: 1.2;
  margin-bottom: 1rem;
}

h1 { font-size: 2.5rem; }
h2 { font-size: 2rem; }
h3 { font-size: 1.5rem; }
h4 { font-size: 1.25rem; }
h5 { font-size: 1.1rem; }
h6 { font-size: 1rem; }

p {
  margin-bottom: 1rem;
}

a {
  color: #8B4513;
  text-decoration: none;
  transition: color 0.3s ease;
}

a:hover {
  color: #D2691E;
}

/* Buttons */
button {
  cursor: pointer;
  border: none;
  border-radius: 0.25rem;
  font-size: 1rem;
  transition: all 0.3s ease;
}

/* Forms */
input, textarea, select {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #ddd;
  border-radius: 0.25rem;
  font-family: inherit;
  font-size: 1rem;
}

input:focus, textarea:focus, select:focus {
  outline: none;
  border-color: #8B4513;
  box-shadow: 0 0 0 3px rgba(139, 69, 19, 0.1);
}

/* Utility Classes */
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 1rem;
}

.section {
  padding: 4rem 0;
}

.section-title {
  text-align: center;
  margin-bottom: 3rem;
}
```

## CSS Variables

### Theme Variables

`src/styles/variables.css`:

```css
:root {
  /* Colors */
  --color-primary: #8B4513;
  --color-secondary: #D2691E;
  --color-accent: #FFD700;
  --color-light: #F5F5F5;
  --color-dark: #333;
  --color-border: #ddd;
  --color-success: #28a745;
  --color-error: #dc3545;
  --color-warning: #ffc107;
  --color-info: #17a2b8;

  /* Typography */
  --font-primary: 'Georgia', serif;
  --font-secondary: 'Segoe UI', sans-serif;
  --font-size-base: 1rem;
  --font-size-sm: 0.875rem;
  --font-size-lg: 1.125rem;
  --font-size-xl: 1.5rem;
  --font-size-2xl: 2rem;

  /* Spacing */
  --spacing-xs: 0.25rem;
  --spacing-sm: 0.5rem;
  --spacing-md: 1rem;
  --spacing-lg: 1.5rem;
  --spacing-xl: 2rem;
  --spacing-2xl: 3rem;

  /* Border Radius */
  --radius-sm: 0.25rem;
  --radius-md: 0.5rem;
  --radius-lg: 1rem;

  /* Shadows */
  --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
  --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
  --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
  --shadow-xl: 0 20px 25px rgba(0, 0, 0, 0.1);

  /* Transitions */
  --transition-fast: 150ms ease-in-out;
  --transition-base: 300ms ease-in-out;
  --transition-slow: 500ms ease-in-out;
}

/* Dark Mode */
@media (prefers-color-scheme: dark) {
  :root {
    --color-dark: #f5f5f5;
    --color-light: #333;
    --color-border: #555;
  }
}
```

### Using CSS Variables

```css
.button {
  background-color: var(--color-primary);
  color: white;
  padding: var(--spacing-md) var(--spacing-lg);
  border-radius: var(--radius-md);
  font-size: var(--font-size-base);
  transition: background-color var(--transition-base);
}

.button:hover {
  background-color: var(--color-secondary);
}
```

## Responsive Design

### Breakpoints

Tailwind breakpoints:

```
sm: 640px
md: 768px
lg: 1024px
xl: 1280px
2xl: 1536px
```

### Mobile-First Approach

```html
<!-- Start with mobile, add larger screens -->
<div class="text-sm md:text-base lg:text-lg">
  Responsive text size
</div>

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
  Responsive grid
</div>

<div class="flex flex-col md:flex-row gap-4">
  Responsive flex
</div>
```

### Media Queries

```css
/* Mobile First */
.menu-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1rem;
}

/* Tablet */
@media (min-width: 768px) {
  .menu-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

/* Desktop */
@media (min-width: 1024px) {
  .menu-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}
```

## Best Practices

### 1. Use Tailwind First

```html
<!-- Good: Use Tailwind utilities -->
<div class="flex justify-center items-center gap-4 p-4">
  Content
</div>

<!-- Avoid: Custom CSS for simple layouts -->
<div style="display: flex; justify-content: center; align-items: center;">
  Content
</div>
```

### 2. Component-Scoped Styles

```typescript
// Good: Scoped styles
@Component({
  selector: 'app-menu',
  styleUrls: ['./menu.component.css']
})

// Avoid: Global styles for component-specific styling
```

### 3. Use CSS Variables

```css
/* Good: Use variables for consistency */
.button {
  background-color: var(--color-primary);
  padding: var(--spacing-md);
}

/* Avoid: Hard-coded values */
.button {
  background-color: #8B4513;
  padding: 1rem;
}
```

### 4. Consistent Naming

```css
/* Good: BEM naming convention */
.menu-item { }
.menu-item__title { }
.menu-item__price { }
.menu-item--featured { }

/* Avoid: Unclear names */
.item { }
.title { }
.big-text { }
```

### 5. Organize Styles

```css
/* Good: Organized sections */

/* Layout */
.container { }

/* Typography */
.heading { }

/* Components */
.button { }

/* Utilities */
.hidden { }
```

## Theming

### Light Theme (Default)

```css
:root {
  --color-primary: #8B4513;
  --color-secondary: #D2691E;
  --color-background: #ffffff;
  --color-text: #333333;
}
```

### Dark Theme

```css
@media (prefers-color-scheme: dark) {
  :root {
    --color-primary: #D2691E;
    --color-secondary: #FFD700;
    --color-background: #1a1a1a;
    --color-text: #ffffff;
  }
}
```

### Custom Theme

```css
/* Custom theme class */
body.theme-warm {
  --color-primary: #8B4513;
  --color-secondary: #D2691E;
}

body.theme-cool {
  --color-primary: #2c3e50;
  --color-secondary: #3498db;
}
```

## Performance Tips

1. **Minimize CSS**: Use Tailwind's purge feature
2. **Avoid Inline Styles**: Use classes instead
3. **Use CSS Variables**: For dynamic theming
4. **Optimize Images**: Use responsive images
5. **Lazy Load Styles**: Load component styles on demand

## Resources

- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [CSS Variables Guide](https://developer.mozilla.org/en-US/docs/Web/CSS/--*)
- [BEM Naming Convention](http://getbem.com/)
- [CSS Best Practices](https://developer.mozilla.org/en-US/docs/Web/CSS)

---

Last updated: March 2026
