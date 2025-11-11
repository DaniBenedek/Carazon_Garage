import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Szerviz } from './szerviz';

describe('Szerviz', () => {
  let component: Szerviz;
  let fixture: ComponentFixture<Szerviz>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Szerviz]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Szerviz);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
