import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GalleryOverview } from './gallery-overview';

describe('GalleryOverview', () => {
  let component: GalleryOverview;
  let fixture: ComponentFixture<GalleryOverview>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [GalleryOverview]
    })
    .compileComponents();

    fixture = TestBed.createComponent(GalleryOverview);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
