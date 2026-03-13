import { Component, HostListener, OnDestroy } from '@angular/core';
import { CommonModule } from '@angular/common';

interface GalleryItem {
  id: number;
  title: string;
  category: string;
  imageUrl: string;
}

@Component({
  selector: 'app-gallery',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './gallery.html',
  styleUrl: './gallery.css',
})
export class Gallery implements OnDestroy {
  // Gallery data – replace with your own images
  galleryItems: GalleryItem[] = [
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
    },
    { 
      id: 4, 
      title: 'Fényezés', 
      category: 'Karosszéria', 
      imageUrl: 'https://images.unsplash.com/photo-1600712242805-5f78671a6b8c?q=80&w=800' 
    },
    { 
      id: 5, 
      title: 'Motorsport Felkészítés', 
      category: 'Verseny', 
      imageUrl: 'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?q=80&w=800' 
    },
    { 
      id: 6, 
      title: 'Alvázvédelem', 
      category: 'Szerviz', 
      imageUrl: 'https://images.unsplash.com/photo-1560179707-f14e90ef3623?q=80&w=800' 
    }
  ];

  categories: string[] = [];
  activeCategory: string = 'Összes';
  filteredItems: GalleryItem[] = [];

  // Lightbox state
  showModal: boolean = false;
  selectedImage: GalleryItem | null = null;

  constructor() {
    this.extractCategories();
    this.filterItems();
  }

  ngOnDestroy(): void {
    // Ensure body scrolling is restored if component is destroyed while modal is open
    document.body.style.overflow = '';
  }

  private extractCategories(): void {
    const uniqueCategories = [...new Set(this.galleryItems.map(item => item.category))];
    this.categories = ['Összes', ...uniqueCategories];
  }

  filterByCategory(category: string): void {
    this.activeCategory = category;
    this.filterItems();
  }

  private filterItems(): void {
    if (this.activeCategory === 'Összes') {
      this.filteredItems = this.galleryItems;
    } else {
      this.filteredItems = this.galleryItems.filter(item => item.category === this.activeCategory);
    }
  }

  // Lightbox methods
  openModal(item: GalleryItem): void {
    this.selectedImage = item;
    this.showModal = true;
    document.body.style.overflow = 'hidden'; // prevent background scrolling
  }

  closeModal(event?: MouseEvent): void {
    if (event) {
      // Only close when clicking the backdrop (not the image or buttons)
      if ((event.target as HTMLElement).classList.contains('bg-black/90')) {
        this.showModal = false;
        document.body.style.overflow = '';
      }
    } else {
      this.showModal = false;
      document.body.style.overflow = '';
    }
  }

  // Navigation helpers
  get hasPrev(): boolean {
    if (!this.selectedImage || !this.filteredItems.length) return false;
    const currentIndex = this.filteredItems.findIndex(item => item.id === this.selectedImage!.id);
    return currentIndex > 0;
  }

  get hasNext(): boolean {
    if (!this.selectedImage || !this.filteredItems.length) return false;
    const currentIndex = this.filteredItems.findIndex(item => item.id === this.selectedImage!.id);
    return currentIndex < this.filteredItems.length - 1;
  }

  prevImage(event: MouseEvent): void {
    event.stopPropagation();
    if (this.hasPrev) {
      const currentIndex = this.filteredItems.findIndex(item => item.id === this.selectedImage!.id);
      this.selectedImage = this.filteredItems[currentIndex - 1];
    }
  }

  nextImage(event: MouseEvent): void {
    event.stopPropagation();
    if (this.hasNext) {
      const currentIndex = this.filteredItems.findIndex(item => item.id === this.selectedImage!.id);
      this.selectedImage = this.filteredItems[currentIndex + 1];
    }
  }

  // Keyboard navigation
  @HostListener('document:keydown', ['$event'])
  handleKeyboardEvent(event: KeyboardEvent): void {
    if (!this.showModal) return;

    switch (event.key) {
      case 'Escape':
        this.closeModal();
        break;
      case 'ArrowLeft':
        if (this.hasPrev) this.prevImage(event as any);
        break;
      case 'ArrowRight':
        if (this.hasNext) this.nextImage(event as any);
        break;
    }
  }
}