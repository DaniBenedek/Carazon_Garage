import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { GalleryService, GalleryItem } from '../../services/gallery';

@Component({
  selector: 'app-gallery-overview',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './gallery-overview.html',
  styleUrl: './gallery-overview.css'
})
export class GalleryOverview {

  categories: any[] = [];
  filteredItems: GalleryItem[] = [];
  activeCategory = 'all';

  constructor(private galleryService: GalleryService) {
    this.categories = galleryService.getCategories();
    this.filteredItems = galleryService.getAllItems();
  }

  filter(category: string) {

    this.activeCategory = category;

    if (category === 'all') {
      this.filteredItems = this.galleryService.getAllItems();
    } else {
      this.filteredItems = this.galleryService.getItemsByCategory(category);
    }
  }
}