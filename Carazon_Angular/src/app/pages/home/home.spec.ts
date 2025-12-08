import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HomeComponent } from './home';
import { By } from '@angular/platform-browser';

describe('HomeComponent', () => {
  let component: HomeComponent;
  let fixture: ComponentFixture<HomeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HomeComponent]
    }).compileComponents();

    fixture = TestBed.createComponent(HomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create the component', () => {
    expect(component).toBeTruthy();
  });

  it('should have a title in hero section', () => {
    const titleElement = fixture.debugElement.query(By.css('.hero-left h1'));
    expect(titleElement.nativeElement.textContent).toContain("Danijel's Carving Art");
  });

  it('should toggle language when language button is clicked', () => {
    const initialLanguage = component.currentLanguage;
    const languageButton = fixture.debugElement.query(By.css('.hero-language-toggle'));
    
    languageButton.triggerEventHandler('click', null);
    fixture.detectChanges();
    
    expect(component.currentLanguage).not.toBe(initialLanguage);
  });

  it('should display showcase cards', () => {
    fixture.detectChanges();
    const showcaseCards = fixture.debugElement.queryAll(By.css('.showcase-card'));
    expect(showcaseCards.length).toBeGreaterThan(0);
  });

  it('should call explorePortfolio when portfolio button is clicked', () => {
    spyOn(component, 'explorePortfolio');
    const portfolioButton = fixture.debugElement.query(By.css('.hero-actions button:first-child'));
    
    portfolioButton.triggerEventHandler('click', null);
    
    expect(component.explorePortfolio).toHaveBeenCalled();
  });

  it('should have testimonials data', () => {
    expect(component.testimonials.length).toBeGreaterThan(0);
    expect(component.testimonials[0].quote).toBeTruthy();
    expect(component.testimonials[0].author).toBeTruthy();
  });

  it('should handle card hover events', () => {
    const card = component.showcaseCards[0];
    const event = new MouseEvent('mouseenter');
    
    spyOn(component, 'onCardHover');
    const cardElement = fixture.debugElement.query(By.css('.showcase-card:first-child'));
    cardElement.triggerEventHandler('mouseenter', event);
    
    expect(component.onCardHover).toHaveBeenCalledWith(event,);
  });

  it('should generate correct card size classes', () => {
    const largeCardClass = component.getCardSizeClass('large');
    const mediumCardClass = component.getCardSizeClass('medium');
    const smallCardClass = component.getCardSizeClass('small');
    
    expect(largeCardClass).toContain('col-span-2');
    expect(mediumCardClass).toContain('col-span-1');
    expect(smallCardClass).toContain('col-span-1');
  });

  it('should have timeline items', () => {
    expect(component.timelineItems.length).toBe(4);
    expect(component.timelineItems[0].title).toBe('The Beginning');
    expect(component.timelineItems[1].side).toBe('right');
  });

  it('should render contact methods', () => {
    fixture.detectChanges();
    const contactMethods = fixture.debugElement.queryAll(By.css('.contact-method-card'));
    expect(contactMethods.length).toBe(2);
  });

  it('should initialize with EN as default language', () => {
    expect(component.currentLanguage).toBe('EN');
  });
});