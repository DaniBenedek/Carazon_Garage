import { Component, OnInit, AfterViewInit, OnDestroy, HostListener } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './home.html',
  styleUrls: ['./home.css']
})
export class HomeComponent implements OnInit, AfterViewInit, OnDestroy {
  currentLanguage = 'EN';
  showLanguageOptions = false;
  
  // Data for showcase cards
  showcaseCards = [
    {
      title: 'Ornamental Relief Panel',
      description: 'Intricate baroque-inspired design carved from aged walnut',
      image: 'https://images.pexels.com/photos/5974283/pexels-photo-5974283.jpeg?auto=compress&cs=tinysrgb&w=1500',
      size: 'large'
    },
    {
      title: 'Contemporary Sculpture',
      description: 'Minimalist form meets traditional craftsmanship',
      image: 'https://images.pexels.com/photos/4491910/pexels-photo-4491910.jpeg?auto=compress&cs=tinysrgb&w=1500',
      size: 'medium'
    },
    {
      title: 'Architectural Element',
      description: 'Custom carved trim for heritage restoration',
      image: 'https://images.pexels.com/photos/5711226/pexels-photo-5711226.jpeg?auto=compress&cs=tinysrgb&w=1500',
      size: 'small'
    },
    {
      title: 'Functional Art Pieces',
      description: 'Where utility meets artistic expression',
      image: 'https://images.pexels.com/photos/29644979/pexels-photo-29644979.jpeg?auto=compress&cs=tinysrgb&w=1500',
      size: 'medium'
    },
    {
      title: 'Decorative Details',
      description: 'Hand-carved embellishments',
      image: 'https://images.pexels.com/photos/5974277/pexels-photo-5974277.jpeg?auto=compress&cs=tinysrgb&w=1500',
      size: 'small'
    },
    {
      title: 'Custom Commissions',
      description: 'Personalized designs brought to life through masterful execution',
      image: 'https://images.pexels.com/photos/4888651/pexels-photo-4888651.jpeg?auto=compress&cs=tinysrgb&w=1500',
      size: 'large'
    }
  ];

  // Data for testimonials
  testimonials = [
    {
      quote: 'The carved panel Danijel created for our dining room is nothing short of breathtaking.',
      author: 'Margaret Thompson',
      role: 'Interior Designer, London',
      avatar: 'https://images.pexels.com/photos/634511/pexels-photo-634511.jpeg?auto=compress&cs=tinysrgb&w=1500'
    },
    {
      quote: 'Working with Danijel was an absolute pleasure. His professionalism and dedication to the craft are evident in every stroke.',
      author: 'Viktor Kovács',
      role: 'Art Collector, Budapest',
      avatar: 'https://images.pexels.com/photos/4491910/pexels-photo-4491910.jpeg?auto=compress&cs=tinysrgb&w=1500'
    },
    {
      quote: 'Exceptional quality and timeless beauty. The commissioned piece perfectly captures our vision.',
      author: 'Anna Szabó',
      role: 'Homeowner, Vienna',
      avatar: 'https://images.pexels.com/photos/6790101/pexels-photo-6790101.jpeg?auto=compress&cs=tinysrgb&w=1500'
    },
    {
      quote: 'We commissioned Danijel for our heritage restoration project. His ability to replicate historical carving styles is remarkable.',
      author: 'James Mitchell',
      role: 'Architectural Conservator',
      avatar: 'https://images.pexels.com/photos/4491868/pexels-photo-4491868.jpeg?auto=compress&cs=tinysrgb&w=1500'
    }
  ];

  // Data for timeline
  timelineItems = [
    {
      title: 'The Beginning',
      description: 'What started as a fascination with wood grain and texture evolved into a lifelong pursuit.',
      year: '1995',
      icon: 'calendar',
      side: 'left'
    },
    {
      title: 'Mastery Through Practice',
      description: 'Years of relentless dedication refined raw talent into expertise.',
      year: '2005',
      icon: 'award',
      side: 'right'
    },
    {
      title: 'Philosophy of Craft',
      description: 'True craftsmanship honors the material. Every piece of wood has a story waiting to be revealed.',
      year: '2015',
      icon: 'heart',
      side: 'left'
    },
    {
      title: 'Today and Tomorrow',
      description: 'From heritage restoration to contemporary design, each commission is approached with passion.',
      year: 'Present',
      icon: 'star',
      side: 'right'
    }
  ];

  // Scroll position for parallax
  scrollY = 0;
  
  constructor() {}

  ngOnInit(): void {
    // Initialize any component data
  }

  ngAfterViewInit(): void {
    setTimeout(() => {
      this.initParallax();
      this.initIntersectionObserver();
    }, 100);
  }

  ngOnDestroy(): void {
    // Clean up any event listeners
    window.removeEventListener('scroll', this.onScroll.bind(this));
  }

  @HostListener('window:scroll', [])
  onScroll(): void {
    this.scrollY = window.scrollY;
    
    // Update parallax effect
    const heroVideo = document.querySelector('.hero-video') as HTMLElement;
    const heroOverlay = document.querySelector('.hero-overlay') as HTMLElement;
    const heroSection = document.querySelector('.hero-section') as HTMLElement;
    
    if (heroVideo && heroOverlay && heroSection) {
      const heroHeight = heroSection.offsetHeight;
      const scrolled = this.scrollY;
      
      if (scrolled < heroHeight) {
        const translateY = scrolled * 0.5;
        const opacity = Math.max(0.6, 1 - (scrolled / heroHeight) * 0.7);
        
        heroVideo.style.transform = `translateY(${translateY}px)`;
        heroOverlay.style.opacity = opacity.toString();
      }
    }
  }

  private initParallax(): void {
    // Parallax is now handled by the @HostListener
  }

  private initIntersectionObserver(): void {
    const observerOptions = {
      threshold: 0.15,
      rootMargin: '0px 0px -100px 0px',
    };

    const fadeElements = document.querySelectorAll('.testimonials-card, .about-timeline-item, .showcase-card');
    
    const fadeObserver = new IntersectionObserver((entries) => {
      entries.forEach((entry, index) => {
        if (entry.isIntersecting) {
          setTimeout(() => {
            (entry.target as HTMLElement).style.animationPlayState = 'running';
          }, index * 100);
          fadeObserver.unobserve(entry.target);
        }
      });
    }, observerOptions);

    fadeElements.forEach((el) => {
      (el as HTMLElement).style.animationPlayState = 'paused';
      fadeObserver.observe(el);
    });
  }

  // Language toggle
  toggleLanguage(): void {
    this.currentLanguage = this.currentLanguage === 'EN' ? 'HU' : 'EN';
    this.showLanguageOptions = false;
  }

  // Card hover effects
  onCardHover(event: MouseEvent, card: any): void {
    const cardElement = event.currentTarget as HTMLElement;
    cardElement.style.transform = 'translateY(-8px)';
  }

  onCardLeave(event: MouseEvent, card: any): void {
    const cardElement = event.currentTarget as HTMLElement;
    cardElement.style.transform = 'translateY(0)';
  }

  // Action methods
  explorePortfolio(): void {
    // Navigate to portfolio or show modal
    console.log('Explore Portfolio clicked');
  }

  commissionPiece(): void {
    // Navigate to contact or show form
    console.log('Commission Piece clicked');
  }

  viewDetails(card: any): void {
    // Show details for specific card
    console.log('View details for:', card.title);
  }

  getCardSizeClass(size: string): string {
    switch(size) {
      case 'large':
        return 'md:col-span-2 lg:col-span-2';
      case 'medium':
        return 'md:col-span-1 lg:col-span-1';
      case 'small':
        return 'md:col-span-1 lg:col-span-1';
      default:
        return '';
    }
  }

  getIconPath(icon: string): string {
    switch(icon) {
      case 'calendar':
        return 'M8 2v4m8-4v4M3 10h18M3 10v8a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-8M3 10l1-6a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2l1 6';
      case 'award':
        return 'm15.477 12.89l1.515 8.526a.5.5 0 0 1-.81.47l-3.58-2.687a1 1 0 0 0-1.197 0l-3.586 2.686a.5.5 0 0 1-.81-.469l1.514-8.526 M12 8a6 6 0 1 0 0 12 6 6 0 0 0 0-12z';
      case 'heart':
        return 'M4.318 6.318a4.5 4.5 0 0 0 0 6.364L12 20.364l7.682-7.682a4.5 4.5 0 0 0-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 0 0-6.364 0z';
      case 'star':
        return 'M11.049 2.927c.3-.921 1.603-.921 1.902 0l1.519 4.674a1 1 0 0 0 .95.69h4.915c.969 0 1.371 1.24.588 1.81l-3.976 2.888a1 1 0 0 0-.363 1.118l1.518 4.674c.3.922-.755 1.688-1.538 1.118l-3.976-2.888a1 1 0 0 0-1.176 0l-3.976 2.888c-.783.57-1.838-.197-1.538-1.118l1.518-4.674a1 1 0 0 0-.363-1.118l-3.976-2.888c-.784-.57-.38-1.81.588-1.81h4.914a1 1 0 0 0 .951-.69l1.519-4.674z';
      default:
        return '';
    }
  }

  getTimelinePositionClass(side: string): string {
    return side === 'left' ? 'lg:flex-row' : 'lg:flex-row-reverse';
  }

  getTimelineContentClass(side: string): string {
    return side === 'left' ? 'lg:text-right lg:pr-8' : 'lg:text-left lg:pl-8';
  }
}