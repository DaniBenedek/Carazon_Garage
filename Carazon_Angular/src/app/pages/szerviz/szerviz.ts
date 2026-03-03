import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-szerviz',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule],
  templateUrl: './szerviz.html',
  styleUrl: './szerviz.css',
})

// szervíz osztály definíció
export class Szerviz {
  bookingForm: FormGroup;
  currentStep = 1;
  selectedDate: Date | null = null;
  selectedSlot: string | null = null;
  timeSlots: string[] = [];
  
  // naptár adatok
  currentMonth = new Date(); // aktuális hónap
  daysInMonth: number[] = [];

  // jelenlegi elérhető szolgáltatások
  services: any[] = [];

  // komponens inicializálása, űrlap létrehozása és időpontok generálása
  constructor(private fb: FormBuilder, private http: HttpClient) {
    this.bookingForm = this.fb.group({
      service: ['', Validators.required],
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      phone: ['', Validators.required]
    });
    this.generateTimeSlots();
    this.generateCalendar();
    this.loadServices(); 
  }

  // Naptár Napjainak létrehozása
  generateCalendar() {
  let year = this.currentMonth.getFullYear();
  let month = this.currentMonth.getMonth();

  let firstDayOfMonth = new Date(year, month, 1).getDay(); 

  let daysCount = new Date(year, month + 1, 0).getDate();

  let days: number[] = [];

  // Üres helyek a hónap elején
  for (let i = 0; i < firstDayOfMonth; i++) {
    days.push(0);
  }

  // Hónap napjai
  for (let i = 1; i <= daysCount; i++) {
    days.push(i);
  }

  this.daysInMonth = days;
}
  isDayClosed(day: number): boolean {
  if (day === 0) return false;

  const date = new Date(
    this.currentMonth.getFullYear(),
    this.currentMonth.getMonth(),
    day
  );

  let dayOfWeek = date.getDay(); 

  return dayOfWeek === 0 || dayOfWeek === 6;
}

  // 9 től 17 óráig 30 percenként időpont létrehozás
  generateTimeSlots() {
    for (let hour = 9; hour < 17; hour++) {
      this.timeSlots.push(`${hour.toString().padStart(2, '0')}:00`);
      this.timeSlots.push(`${hour.toString().padStart(2, '0')}:30`);
    }
  }

  loadServices() {
  this.http.get<any[]>('http://localhost:3000/api/services')
    .subscribe(data => {
      this.services = data;
    });
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

  // foglalás megerősítése és a konzolra az adatok kíírása
  confirmBooking() {
    console.log('Foglalás adatai:', {
      ...this.bookingForm.value,
      date: this.selectedDate,
      slot: this.selectedSlot
    });
    this.nextStep();
  }
}