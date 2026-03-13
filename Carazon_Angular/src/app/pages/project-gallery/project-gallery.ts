import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommonModule } from '@angular/common';
import { GalleryService, GalleryItem } from '../../services/gallery';

@Component({
  selector: 'app-project-gallery',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './project-gallery.html',
  styleUrl: './project-gallery.css'
})
export class ProjectGallery {

  images: GalleryItem[] = [];
  categoryName = '';

  constructor(
    private route: ActivatedRoute,
    private galleryService: GalleryService
  ) {

    this.route.params.subscribe(params => {

      const slug = params['categorySlug'];

      this.images = this.galleryService.getItemsByCategory(slug);

      if (this.images.length > 0) {
        this.categoryName = this.images[0].category;
      }

    });

  }
}