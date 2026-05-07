import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms'; // Szükséges a szerkesztő formhoz

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [CommonModule, HttpClientModule, FormsModule], // FormsModule hozzáadva
  templateUrl: './profile.html',
  styleUrl: './profile.css',
})
export class Profile implements OnInit {
  user = JSON.parse(localStorage.getItem('carazongarage_user') || 'null');
  appointments: any[] = [];
  stats = { carsCount: 0, completedServices: 0 };

  // Modal állapot és ideiglenes adat tároló
  isEditModalOpen = false;
  editUserData = {
    name: '',
    email: '',
    password: ''
  };

  constructor(
    private http: HttpClient,
    private cdr: ChangeDetectorRef
  ) {}

  ngOnInit(): void {
    if (!this.user || !this.user.id) {
      const savedUser = localStorage.getItem('carazongarage_user');
      if (savedUser) {
        this.user = JSON.parse(savedUser);
      }
    }

    if (this.user && this.user.id) {
      this.loadStats();
      this.loadAppointments();
    } else {
      console.warn('Nincs bejelentkezett felhasználó!');
    }
  }

  // --- Adatbetöltés ---

  loadStats() {
    this.http.get<any>(`http://localhost:3000/api/user-stats/${this.user.id}`)
      .subscribe(res => {
        this.stats = res;
        this.cdr.detectChanges();
      });
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
          this.loadStats();
        });
    }
  }

  // --- Képkezelés ---

  onFileSelected(event: any) {
    const file: File = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = () => {
        const base64String = reader.result as string;

        this.user.img = base64String; 

        this.http.post('http://localhost:3000/api/user/update-profile-image', {
          userId: this.user.id,
          image: base64String
        }).subscribe({
          next: (res: any) => {
            this.user = res.user;
            localStorage.setItem('carazongarage_user', JSON.stringify(this.user));
            console.log('Szerver visszaigazolta a mentést');
          },
          error: (err) => {
            alert('Hiba a mentésnél, de az előnézet látszik.');
          }
        });
      };
      reader.readAsDataURL(file);
    }
  } 

  openEditModal() {
    // Feltöltjük az ideiglenes objektumot a jelenlegi adatokkal
    this.editUserData.name = this.user.name;
    this.editUserData.email = this.user.email;
    this.editUserData.password = ''; // A jelszó maradjon üres biztonsági okokból
    this.isEditModalOpen = true;
  }

  closeEditModal() {
    this.isEditModalOpen = false;
  }

  saveProfile() {
    console.log('Küldendő adatok:', this.editUserData);

    const updatePayload: any = {
      id: this.user.id,
      name: this.editUserData.name,
      email: this.editUserData.email
    };

    // Csak akkor küldjük a jelszót, ha beírt valamit
    if (this.editUserData.password.trim().length > 0) {
      updatePayload.password = this.editUserData.password;
    }

    this.http.post('http://localhost:3000/api/user/update', updatePayload)
      .subscribe({
        next: (res: any) => {
          // 1. Frissítjük a helyi változót
          this.user = res.user;
          // 2. Frissítjük a localStorage-t
          localStorage.setItem('carazongarage_user', JSON.stringify(res.user));
          // 3. Bezárjuk a modalt
          this.closeEditModal();
          alert('Profil sikeresen frissítve!');
        },
        error: (err) => {
          console.error('Szerkesztési hiba:', err);
          alert('Hiba történt a mentés során!');
        }
      });
  }
}