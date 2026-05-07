import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

export interface GalleryOverviewItem {
  id: number;
  title: string;
  category?: string;
  imageUrl: string;
}

@Component({
  selector: 'app-gallery-overview',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './gallery-overview.html',
  styleUrls: ['./gallery-overview.css']
})
export class GalleryOverviewComponent {

  // Az adatok közvetlenül itt vannak
  allItems: GalleryOverviewItem[] = [
    { id: 1, title: 'Dani Benedek', category: 'Portré', imageUrl: 'assets/pictures/osztaly/dani_benedek_1.jpg' },
    { id: 2, title: 'Dani Benedek', category: 'Portré', imageUrl: 'assets/pictures/osztaly/dani_benedek_2.jpg' },
    { id: 3, title: 'Fodor Adrián', category: 'Esemény', imageUrl: 'assets/pictures/osztaly/fodor_adrian_1.jpg' },
    { id: 4, title: 'Fodor Adrián', category: 'Esemény', imageUrl: 'assets/pictures/osztaly/fodor_adrian_2.jpg' },
    { id: 5, title: 'Guvat Bence', category: 'Portré', imageUrl: 'assets/pictures/osztaly/guvat_bence_1.jpg' },
    { id: 6, title: 'Guvat Bence', category: 'Portré', imageUrl: 'assets/pictures/osztaly/guvat_bence_2.jpg' },
    { id: 7, title: 'Mazda', category: 'Autó', imageUrl: 'assets/pictures/osztaly/mazda_3.jpg' },
    { id: 8, title: 'Miklós Martin', category: 'Portré', imageUrl: 'assets/pictures/osztaly/miklos_martin_1.jpg' },
    { id: 9, title: 'Miklós Martin', category: 'Portré', imageUrl: 'assets/pictures/osztaly/miklos_martin_2.jpg' },
    { id: 10, title: 'Szántó Peti', category: 'Portré', imageUrl: 'assets/pictures/osztaly/szanto_peti.jpg' }
  ];

  // Lightbox
  modalOpen = false;
  modalIndex = 0;

  get currentItem(): GalleryOverviewItem {
    return this.allItems[this.modalIndex];
  }

  openModal(index: number): void {
    this.modalIndex = index;
    this.modalOpen = true;
    
    // Megakadályozzuk a görgetést a háttérben, ha nyitva a modal
    document.body.style.overflow = 'hidden';
  }

  closeModal(): void {
    this.modalOpen = false;
    document.body.style.overflow = 'auto';
  }

  next(): void {
    this.modalIndex = (this.modalIndex + 1) % this.allItems.length;
  }

  prev(): void {
    this.modalIndex = (this.modalIndex - 1 + this.allItems.length) % this.allItems.length;
  }
}