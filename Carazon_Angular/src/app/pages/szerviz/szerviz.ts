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

// szerviz komponens osztály definíciója
export class Szerviz {
  bookingForm: FormGroup;
  currentStep = 1;
  selectedDate: Date | null = null;
  selectedSlot: string | null = null;
  timeSlots: string[] = [];
  
  // naptár adatok
  currentMonth = new Date(2026, 0); // január 2026
  daysInMonth: number[] = [];
  
  // zárolt napok (amikor nem dolgozol)
  closedDates: number[] = [1, 7, 14, 21, 28]; // példa: vasárnapok

  // elérhető szerviz szolgáltatások listája
  services = [
    { id: 1, name: 'Általános Szerviz', price: '25.000 Ft-tól' },
    { id: 2, name: 'Diagnosztika', price: '15.000 Ft' },
    { id: 3, name: 'Prémium Kozmetika', price: '40.000 Ft-tól' }
  ];

  // komponens inicializálása, űrlap létrehozása és időpontok generálása
  constructor(private fb: FormBuilder) {
    this.bookingForm = this.fb.group({
      service: ['', Validators.required],
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      phone: ['', Validators.required]
    });
    this.generateTimeSlots();
    this.generateCalendar();
  }

  // naptár napjainak generálása
  generateCalendar() {
    const year = this.currentMonth.getFullYear();
    const month = this.currentMonth.getMonth();
    const daysCount = new Date(year, month + 1, 0).getDate();
    
    this.daysInMonth = Array.from({ length: daysCount }, (_, i) => i + 1);
  }

  // ellenőrzi hogy az adott nap zárva van-e
  isDayClosed(day: number): boolean {
    return this.closedDates.includes(day);
  }

  // időpontok generálása 9-től 17 óráig 30 perces intervallumokban
  generateTimeSlots() {
    for (let hour = 9; hour < 17; hour++) {
      this.timeSlots.push(`${hour.toString().padStart(2, '0')}:00`);
      this.timeSlots.push(`${hour.toString().padStart(2, '0')}:30`);
    }
  }

  // dátum kiválasztása a naptárból
  selectDate(day: number) {
    if (!this.isDayClosed(day)) {
      this.selectedDate = new Date(
        this.currentMonth.getFullYear(), 
        this.currentMonth.getMonth(), 
        day
      );
    }
  }

  // léptetés a következő lépésre (maximum 3-ig)
  nextStep() {
    if (this.currentStep < 3) this.currentStep++;
  }

  // foglalás megerősítése és adatok konzolra írása
  confirmBooking() {
    console.log('Foglalás adatai:', {
      ...this.bookingForm.value,
      date: this.selectedDate,
      slot: this.selectedSlot
    });
    this.nextStep();
  }
}