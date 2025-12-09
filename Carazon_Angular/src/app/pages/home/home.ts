import { Component, OnInit, AfterViewInit, OnDestroy, HostListener, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeroService } from '../../services/hero';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './home.html',
  styleUrls: ['./home.css']
})
export class HomeComponent {
  currentLanguage = 'EN';
  showLanguageOptions = false;

  private heroService = inject(HeroService);

  // Hero text from database
  heroTitle = 'Carazon Garage';
  heroSubtitle = '';
  heroDescription = '';

  commissionPiece() {};
  explorePortfolio() {};
}
