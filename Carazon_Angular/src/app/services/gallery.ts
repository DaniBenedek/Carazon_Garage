import { Injectable } from '@angular/core';

export interface GalleryItem {
  id: number;
  title: string;
  category: string;
  categorySlug: string;
  imageUrl: string;
}

@Injectable({
  providedIn: 'root'
})
export class GalleryService {

  private items: GalleryItem[] = [
    {
      id: 1,
      title: 'BMW E46 Motor Generál',
      category: 'Motor Javítás',
      categorySlug: 'motor-javitas',
      imageUrl: 'https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?w=800'
    },
    {
      id: 2,
      title: 'Audi A6 Futómű Szerviz',
      category: 'Futómű',
      categorySlug: 'futomu',
      imageUrl: 'https://images.unsplash.com/photo-1530046339160-ce3e5b087ea2?w=800'
    },
    {
      id: 3,
      title: 'Mercedes Fékcsere',
      category: 'Fék Szerviz',
      categorySlug: 'fek-szerviz',
      imageUrl: 'https://images.unsplash.com/photo-1486006396193-c81ab181d68a?w=800'
    },
    {
      id: 4,
      title: 'Motor Diagnosztika',
      category: 'Diagnosztika',
      categorySlug: 'diagnosztika',
      imageUrl: 'https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?w=800'
    },
    {
      id: 5,
      title: 'BMW Kuplung Csere',
      category: 'Motor Javítás',
      categorySlug: 'motor-javitas',
      imageUrl: 'https://images.unsplash.com/photo-1542362567-b07e54358753?w=800'
    }
  ];

  getAllItems() {
    return this.items;
  }

  getItemsByCategory(slug: string) {
    return this.items.filter(item => item.categorySlug === slug);
  }

  getCategories() {
    const unique = new Map();

    this.items.forEach(item => {
      if (!unique.has(item.categorySlug)) {
        unique.set(item.categorySlug, {
          name: item.category,
          slug: item.categorySlug
        });
      }
    });

    return Array.from(unique.values());
  }
}