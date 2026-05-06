import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [CommonModule, HttpClientModule],
  templateUrl: './profile.html',
  styleUrl: './profile.css',
})
export class Profile implements OnInit {
  user = JSON.parse(localStorage.getItem('carazongarage_user') || 'null');
  appointments: any[] = [];
  stats = { carsCount: 0, completedServices: 0 };

  constructor(private http: HttpClient,
              private cdr: ChangeDetectorRef
  ) {}

  ngOnInit(): void {
    if (this.user && this.user.id) {
      this.loadStats();
      this.loadAppointments();
    } else {
      console.warn('Nincs bejelentkezett felhasználó!');
    }
  }

  loadStats() {
    this.http.get<any>(`http://localhost:3000/api/user-stats/${this.user.id}`)
      .subscribe(res => this.stats = res);
      this.cdr.detectChanges();
  }

  loadAppointments() {
    this.http.get<any[]>(`http://localhost:3000/api/my-appointments/${this.user.id}`)
      .subscribe(res => this.appointments = res);
  }

  cancelAppointment(id: number) {
    if (confirm('Biztosan lemondod ezt az időpontot?')) {
      this.http.delete(`http://localhost:3000/api/appointments/${id}`)
        .subscribe(() => {
          this.appointments = this.appointments.filter(a => a.id !== id);
          this.loadStats(); // Frissítjük a statisztikát is ha kell
        });
    }
  }

  // Profilkép feltöltés szimuláció (Frontend rész)
  onFileSelected(event: any) {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = (e: any) => {
        this.user.img = e.target.result;
        localStorage.setItem('carazongarage_user', JSON.stringify(this.user));
      };
      reader.readAsDataURL(file);
    }
  }
}