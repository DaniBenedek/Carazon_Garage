import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { CommonModule, registerLocaleData } from '@angular/common';
import localeHu from '@angular/common/locales/hu';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';

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
  isSubmitting = false;
  
  // Felhasználó és Jármű kezelés
  loggedInUser = JSON.parse(localStorage.getItem('carazongarage_user') || 'null');
  userVehicles: any[] = [];
  isNewVehicle = false;

  // Naptár adatok
  currentMonth = new Date();
  daysInMonth: number[] = [];
  weekDays = ['H', 'K', 'Sze', 'Cs', 'P', 'Szo', 'V'];
  services: any[] = [];

  constructor(private fb: FormBuilder, 
              private http: HttpClient,
              private cdr: ChangeDetectorRef) {
    this.bookingForm = this.fb.group({
      service: ['', Validators.required],
      vehicle_id: [''],
      make: [''],
      model: [''],
      license_plate: [''],
      name: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      phone: ['', Validators.required]
    });
  }

  ngOnInit() {
    this.generateCalendar();
    this.loadServices();
    this.loadUserVehicles();
    
    if (this.loggedInUser) {
      this.bookingForm.patchValue({
        name: this.loggedInUser.name,
        email: this.loggedInUser.email,
        phone: this.loggedInUser.phone_number || ''
      });
    }
  }

  loadUserVehicles() {
    if (this.loggedInUser) {
      this.http.get<any[]>(`http://localhost:3000/api/my-vehicles/${this.loggedInUser.id}`)
        .subscribe({
          next: (data) => {
            this.userVehicles = data;
            if (data.length > 0) {
              this.isNewVehicle = false;
              this.bookingForm.get('vehicle_id')?.setValue(data[0].id);
            } else {
              this.isNewVehicle = true;
            }
          }
        });
    } else {
      this.isNewVehicle = true;
    }
  }

  toggleVehicleMode(isNew: boolean) {
    this.isNewVehicle = isNew;
    if (isNew) {
      this.bookingForm.get('vehicle_id')?.setValue('');
    }
  }

  // Naptár logika
  generateCalendar() {
    let year = this.currentMonth.getFullYear();
    let month = this.currentMonth.getMonth();
    let firstDayIndex = new Date(year, month, 1).getDay();
    let offset = firstDayIndex === 0 ? 6 : firstDayIndex - 1;
    let daysCount = new Date(year, month + 1, 0).getDate();
    let days: number[] = [];
    for (let i = 0; i < offset; i++) days.push(0);
    for (let i = 1; i <= daysCount; i++) days.push(i);
    this.daysInMonth = days;
  }

  changeMonth(delta: number) {
    this.currentMonth = new Date(this.currentMonth.getFullYear(), this.currentMonth.getMonth() + delta, 1);
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
    if (this.bookingForm.invalid || !this.selectedDate || !this.selectedSlot || this.isSubmitting) return;

    this.isSubmitting = true;

    const bookingDate = new Date(this.selectedDate);
    const [hours, mins] = this.selectedSlot.split(':');
    bookingDate.setHours(parseInt(hours), parseInt(mins), 0);

    const payload = {
      user_id: this.loggedInUser ? this.loggedInUser.id : null,
      service_id: this.bookingForm.value.service,
      date: bookingDate.toISOString().slice(0, 19).replace('T', ' '),
      status: 'booked',
      note: 'Online foglalás',
      vehicle_id: this.isNewVehicle ? null : this.bookingForm.value.vehicle_id,
      newVehicle: this.isNewVehicle ? {
        make: this.bookingForm.value.make,
        model: this.bookingForm.value.model,
        license_plate: this.bookingForm.value.license_plate
      } : null
    };

    this.http.post('http://localhost:3000/api/book-appointment', payload)
  .subscribe({
    next: () => {
      this.currentStep = 3;
      this.isSubmitting = false;
      this.cdr.detectChanges();
    },
    error: (err) => {
      console.error(err);
      alert(err.error?.error || "Hiba történt!");
      this.isSubmitting = false;
      this.cdr.detectChanges();
    }
  });
  }

  resetForm() {
  this.currentStep = 1;
  this.selectedDate = null;
  this.selectedSlot = null;
  this.isSubmitting = false;
  this.bookingForm.reset();
  
  this.loadServices();
  this.loadUserVehicles();
  this.generateCalendar();
  
  if (this.loggedInUser) {
    this.bookingForm.patchValue({
      name: this.loggedInUser.name,
      email: this.loggedInUser.email,
      phone: this.loggedInUser.phone_number || ''
    });
  }
  this.cdr.detectChanges();
}
}