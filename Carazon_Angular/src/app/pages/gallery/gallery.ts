import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-gallery',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './gallery.html',
  styleUrl: './gallery.css',
})
export class Gallery {
  galleryItems = [
    { 
      id: 1, 
      title: 'Klasszikus Restaurálás', 
      category: 'Vintage', 
      imageUrl: 'https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=800' 
    },
    { 
      id: 2, 
      title: 'Modern Tuning', 
      category: 'Performance', 
      imageUrl: 'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?q=80&w=800' 
    },
    { 
      id: 3, 
      title: 'Motor Generál', 
      category: 'Szerviz', 
      imageUrl: 'https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?q=80&w=800' 
    }
  ];

  Munkaink() {
    console.log('Navigálás a munkákhoz...');
  }

  Idopontfoglalas() {
    console.log('Navigálás az időponthoz...');
  }
}