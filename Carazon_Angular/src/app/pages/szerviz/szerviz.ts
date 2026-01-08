import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-szerviz',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './szerviz.html',
  styleUrl: './szerviz.css',
})
export class Szerviz {
  bookingForm: FormGroup;
  currentStep = 1;
  selectedDate: Date | null = null;
  selectedSlot: string | null = null;
  
  // Konfiguráció
  workingHours = { start: 9, end: 17 };
  interval = 30; // perc
  timeSlots: string[] = [];

  services = [
    { id: 1, name: 'Általános Szerviz', price: '25.000 Ft-tól' },
    { id: 2, name: 'Diagnosztika', price: '15.000 Ft' },
    { id: 3, name: 'Prémium Kozmetika', price: '40.000 Ft-tól' }
  ];

  constructor(private fb: FormBuilder) {
    this.bookingForm = this.fb.group({
      service: ['', Validators.required],
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      phone: ['', Validators.required]
    });
  }

  ngOnInit() {
    this.generateTimeSlots();
  }

  generateTimeSlots() {
    const slots = [];
    for (let hour = this.workingHours.start; hour < this.workingHours.end; hour++) {
      slots.push(`${hour.toString().padStart(2, '0')}:00`);
      slots.push(`${hour.toString().padStart(2, '0')}:30`);
    }
    this.timeSlots = slots;
  }

  selectDate(day: number) {
    this.selectedDate = new Date(2026, 0, day); // Példa dátum
  }

  nextStep() {
    if (this.currentStep < 3) this.currentStep++;
  }

  confirmBooking() {
    console.log('Foglalás adatai:', {
      ...this.bookingForm.value,
      date: this.selectedDate,
      slot: this.selectedSlot
    });
    this.nextStep();
  }
}
