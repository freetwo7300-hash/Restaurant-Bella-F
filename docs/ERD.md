# Entity Relationship Diagram (ERD)

Database schema and entity relationships for the Bella Restaurant application.

## Overview

This document describes the data model and relationships for the application.

## Entities

### Restaurant

Represents a restaurant location.

```
Restaurant
├── id: string (PK)
├── name: string
├── description: string
├── address: string
├── phone: string
├── email: string
├── website: string
├── hours: object
├── cuisine_type: string[]
├── rating: number
├── image_url: string
├── created_at: timestamp
└── updated_at: timestamp
```

### MenuItem

Represents a menu item.

```
MenuItem
├── id: string (PK)
├── restaurant_id: string (FK)
├── name: string
├── description: string
├── price: number
├── category: string
├── cuisine_type: string
├── dietary_info: string[]
├── image_url: string
├── available: boolean
├── created_at: timestamp
└── updated_at: timestamp
```

### Chef

Represents a chef profile.

```
Chef
├── id: string (PK)
├── restaurant_id: string (FK)
├── name: string
├── bio: string
├── specialty: string
├── experience_years: number
├── image_url: string
├── social_links: object
├── signature_dishes: string[] (FK to MenuItem)
├── created_at: timestamp
└── updated_at: timestamp
```

### Reservation

Represents a table reservation.

```
Reservation
├── id: string (PK)
├── restaurant_id: string (FK)
├── customer_name: string
├── customer_email: string
├── customer_phone: string
├── date: date
├── time: time
├── party_size: number
├── special_requests: string
├── status: enum (pending, confirmed, cancelled)
├── created_at: timestamp
└── updated_at: timestamp
```

### Review

Represents a customer review.

```
Review
├── id: string (PK)
├── restaurant_id: string (FK)
├── customer_name: string
├── rating: number (1-5)
├── comment: string
├── image_url: string
├── created_at: timestamp
└── updated_at: timestamp
```

### Story

Represents restaurant history/story content.

```
Story
├── id: string (PK)
├── restaurant_id: string (FK)
├── title: string
├── content: string
├── image_url: string
├── date: date
├── category: string
├── created_at: timestamp
└── updated_at: timestamp
```

## Relationships

### Restaurant → MenuItem (1:N)

One restaurant has many menu items.

```
Restaurant (1) ──── (N) MenuItem
```

### Restaurant → Chef (1:N)

One restaurant has many chefs.

```
Restaurant (1) ──── (N) Chef
```

### Restaurant → Reservation (1:N)

One restaurant has many reservations.

```
Restaurant (1) ──── (N) Reservation
```

### Restaurant → Review (1:N)

One restaurant has many reviews.

```
Restaurant (1) ──── (N) Review
```

### Restaurant → Story (1:N)

One restaurant has many stories.

```
Restaurant (1) ──── (N) Story
```

### Chef → MenuItem (N:N)

A chef can have many signature dishes, and a dish can be created by multiple chefs.

```
Chef (N) ──── (N) MenuItem
```

## ER Diagram

```
┌─────────────────┐
│   Restaurant    │
├─────────────────┤
│ id (PK)         │
│ name            │
│ description     │
│ address         │
│ phone           │
│ email           │
│ website         │
│ hours           │
│ cuisine_type[]  │
│ rating          │
│ image_url       │
│ created_at      │
│ updated_at      │
└────────┬────────┘
         │
    ┌────┴────┬────────┬────────┬────────┐
    │         │        │        │        │
    │ 1:N     │ 1:N    │ 1:N    │ 1:N    │ 1:N
    │         │        │        │        │
    ▼         ▼        ▼        ▼        ▼
┌────────┐ ┌────────┐ ┌──────────┐ ┌────────┐ ┌────────┐
│MenuItem│ │ Chef   │ │Reservation│ │Review  │ │ Story  │
├────────┤ ├────────┤ ├──────────┤ ├────────┤ ├────────┤
│id (PK) │ │id (PK) │ │id (PK)   │ │id (PK) │ │id (PK) │
│rest_id │ │rest_id │ │rest_id   │ │rest_id │ │rest_id │
│name    │ │name    │ │cust_name │ │cust_nm │ │title   │
│desc    │ │bio     │ │cust_email│ │rating  │ │content │
│price   │ │spec    │ │cust_phone│ │comment │ │image   │
│cat     │ │exp_yrs │ │date      │ │image   │ │date    │
│cuisine │ │image   │ │time      │ │created │ │cat     │
│dietary │ │social  │ │party_sz  │ │updated │ │created │
│image   │ │sig_dish│ │requests  │ │        │ │updated │
│avail   │ │created │ │status    │ │        │ │        │
│created │ │updated │ │created   │ │        │ │        │
│updated │ │        │ │updated   │ │        │ │        │
└────────┘ └────────┘ └──────────┘ └────────┘ └────────┘
    ▲         │
    │         │ N:N
    │         │
    └─────────┘
```

## Data Types

### String
- Text data (name, description, email, etc.)
- Max length varies by field

### Number
- Integer: party_size, experience_years, rating
- Decimal: price

### Date/Time
- date: Reservation date, Story date
- time: Reservation time
- timestamp: created_at, updated_at

### Boolean
- available: MenuItem availability

### Array
- cuisine_type: Multiple cuisine types
- dietary_info: Multiple dietary restrictions
- signature_dishes: Multiple menu items

### Enum
- status: pending, confirmed, cancelled

### Object
- hours: Opening hours by day
- social_links: Social media profiles

## Indexes

For optimal query performance:

```sql
-- Restaurant indexes
CREATE INDEX idx_restaurant_name ON Restaurant(name);
CREATE INDEX idx_restaurant_cuisine ON Restaurant(cuisine_type);

-- MenuItem indexes
CREATE INDEX idx_menuitem_restaurant ON MenuItem(restaurant_id);
CREATE INDEX idx_menuitem_category ON MenuItem(category);
CREATE INDEX idx_menuitem_available ON MenuItem(available);

-- Chef indexes
CREATE INDEX idx_chef_restaurant ON Chef(restaurant_id);

-- Reservation indexes
CREATE INDEX idx_reservation_restaurant ON Reservation(restaurant_id);
CREATE INDEX idx_reservation_date ON Reservation(date);
CREATE INDEX idx_reservation_status ON Reservation(status);

-- Review indexes
CREATE INDEX idx_review_restaurant ON Review(restaurant_id);
CREATE INDEX idx_review_rating ON Review(rating);

-- Story indexes
CREATE INDEX idx_story_restaurant ON Story(restaurant_id);
CREATE INDEX idx_story_date ON Story(date);
```

## Sample Data

### Restaurant
```json
{
  "id": "rest_001",
  "name": "Bella Restaurant",
  "description": "Premium Italian dining experience",
  "address": "123 Main St, City, State 12345",
  "phone": "+1-555-0123",
  "email": "info@bella.com",
  "website": "https://bella.com",
  "hours": {
    "monday": "11:00-22:00",
    "tuesday": "11:00-22:00",
    "wednesday": "11:00-22:00",
    "thursday": "11:00-22:00",
    "friday": "11:00-23:00",
    "saturday": "12:00-23:00",
    "sunday": "12:00-22:00"
  },
  "cuisine_type": ["Italian", "Mediterranean"],
  "rating": 4.8,
  "image_url": "https://cdn.example.com/bella.jpg"
}
```

### MenuItem
```json
{
  "id": "item_001",
  "restaurant_id": "rest_001",
  "name": "Pasta Carbonara",
  "description": "Classic Italian pasta with eggs, cheese, and pancetta",
  "price": 18.99,
  "category": "Pasta",
  "cuisine_type": "Italian",
  "dietary_info": ["contains-eggs", "contains-dairy"],
  "image_url": "https://cdn.example.com/carbonara.jpg",
  "available": true
}
```

### Chef
```json
{
  "id": "chef_001",
  "restaurant_id": "rest_001",
  "name": "Marco Rossi",
  "bio": "Award-winning chef with 20 years of experience",
  "specialty": "Italian Cuisine",
  "experience_years": 20,
  "image_url": "https://cdn.example.com/marco.jpg",
  "social_links": {
    "instagram": "@marcorossi",
    "twitter": "@marcorossi"
  },
  "signature_dishes": ["item_001", "item_002"]
}
```

### Reservation
```json
{
  "id": "res_001",
  "restaurant_id": "rest_001",
  "customer_name": "John Doe",
  "customer_email": "john@example.com",
  "customer_phone": "+1-555-0456",
  "date": "2026-04-15",
  "time": "19:00",
  "party_size": 4,
  "special_requests": "Window seat preferred",
  "status": "confirmed"
}
```

## API Endpoints

### Restaurant
- GET /api/restaurants
- GET /api/restaurants/:id
- POST /api/restaurants
- PUT /api/restaurants/:id
- DELETE /api/restaurants/:id

### MenuItem
- GET /api/restaurants/:id/menu
- GET /api/menu/:id
- POST /api/menu
- PUT /api/menu/:id
- DELETE /api/menu/:id

### Chef
- GET /api/restaurants/:id/chefs
- GET /api/chefs/:id
- POST /api/chefs
- PUT /api/chefs/:id
- DELETE /api/chefs/:id

### Reservation
- GET /api/restaurants/:id/reservations
- GET /api/reservations/:id
- POST /api/reservations
- PUT /api/reservations/:id
- DELETE /api/reservations/:id

### Review
- GET /api/restaurants/:id/reviews
- GET /api/reviews/:id
- POST /api/reviews
- PUT /api/reviews/:id
- DELETE /api/reviews/:id

### Story
- GET /api/restaurants/:id/stories
- GET /api/stories/:id
- POST /api/stories
- PUT /api/stories/:id
- DELETE /api/stories/:id

---

Last updated: March 2026
