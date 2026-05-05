import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { CommonModule, registerLocaleData } from '@angular/common';
import localeHu from '@angular/common/locales/hu';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';

// Magyar nyelv regisztrálása a dátum pipe-hoz
registerLocaleData(localeHu);

@Component({
  selector: 'app-szerviz',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, HttpClientModule],
  templateUrl: './szerviz.html',
  styleUrl: './szerviz.css',
})
export class Szerviz implements OnInit {
  bookingForm: FormGroup;
  currentStep = 1;
  selectedDate: Date | null = null;
  selectedSlot: string | null = null;
  timeSlots: string[] = [];
  
  // Naptár adatok
  currentMonth = new Date();
  daysInMonth: number[] = [];
  weekDays = ['H', 'K', 'Sze', 'Cs', 'P', 'Szo', 'V'];

  services: any[] = [];

  constructor(private fb: FormBuilder, private http: HttpClient) {
    this.bookingForm = this.fb.group({
      service: ['', Validators.required],
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      phone: ['', Validators.required]
    });
  }

  ngOnInit() {
    this.generateCalendar();
    this.loadServices();
  }

  generateCalendar() {
    let year = this.currentMonth.getFullYear();
    let month = this.currentMonth.getMonth();

    // Hétfői kezdés kiszámítása
    let firstDayIndex = new Date(year, month, 1).getDay();
    let offset = firstDayIndex === 0 ? 6 : firstDayIndex - 1;

    let daysCount = new Date(year, month + 1, 0).getDate();
    let days: number[] = [];

    for (let i = 0; i < offset; i++) {
      days.push(0);
    }

    for (let i = 1; i <= daysCount; i++) {
      days.push(i);
    }

    this.daysInMonth = days;
  }

  changeMonth(delta: number) {
    this.currentMonth = new Date(
      this.currentMonth.getFullYear(),
      this.currentMonth.getMonth() + delta,
      1
    );
    this.generateCalendar();
    this.selectedDate = null;
    this.selectedSlot = null;
    this.timeSlots = [];
  }

  isDayClosed(day: number): boolean {
    if (day === 0) return true;
    const checkDate = new Date(this.currentMonth.getFullYear(), this.currentMonth.getMonth(), day);
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    // Vasárnap (0) vagy múltbéli nap
    return checkDate < today || checkDate.getDay() === 0;
  }

  selectDate(day: number) {
    if (day === 0 || this.isDayClosed(day)) return;
    this.selectedDate = new Date(this.currentMonth.getFullYear(), this.currentMonth.getMonth(), day);
    this.selectedSlot = null;
    this.generateTimeSlots(this.selectedDate);
  }

  generateTimeSlots(date: Date) {
    this.timeSlots = [];
    const dayOfWeek = date.getDay(); 
    // Szombat: 8-13 | Hétköznap: 8-17
    let endHour = (dayOfWeek === 6) ? 13 : 17;

    for (let hour = 8; hour < endHour; hour++) {
      this.timeSlots.push(`${hour.toString().padStart(2, '0')}:00`);
      this.timeSlots.push(`${hour.toString().padStart(2, '0')}:30`);
    }
  }

  loadServices() {
    this.http.get<any[]>('http://localhost:3000/api/services')
      .subscribe({
        next: (data) => this.services = data,
        error: () => this.services = [{ id: 1, name: 'Általános javítás', price: 'Egyedi ár' }]
      });
  }

  nextStep() {
    if (this.currentStep < 3) this.currentStep++;
  }

  confirmBooking() {
    console.log('Adatok:', { ...this.bookingForm.value, date: this.selectedDate, slot: this.selectedSlot });
    this.nextStep();
  }
}