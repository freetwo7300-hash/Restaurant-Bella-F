export interface Restaurant {
  name: string;
  tagline: string;
  description: string;
  openingHours: string;
  contact: {
    phone: string;
    email: string;
    address: string;
  };
}

export interface MenuItem {
  id: number;
  name: string;
  description: string;
  price: number;
  category: string;
  image: string;
  rating?: number;
}

export interface Testimonial {
  id: number;
  name: string;
  comment: string;
  rating: number;
  avatar: string;
  role: string;
}

export interface AppData {
  restaurant: Restaurant;
  menu: MenuItem[];
  testimonials: Testimonial[];
}
