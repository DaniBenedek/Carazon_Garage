import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './profile.html',
  styleUrl: './profile.css',
})
export class Profile implements OnInit {
  // A felhasználói adatok betöltése a tárolóból
  user = JSON.parse(localStorage.getItem('user') || 'null');

  // Példa adatok a felület teszteléséhez (ezeket később API-ból is töltheted)
  appointments = [
    {
      carType: 'BMW M3 (G80)',
      serviceType: 'Időszakos olajcsere',
      date: '2024. Március 12. 10:30',
      status: 'Megerősítve'
    },
    {
      carType: 'Audi RS6',
      serviceType: 'Fékrendszer felújítás',
      date: '2024. Április 05. 08:00',
      status: 'Várakozás'
    }
  ];

  ngOnInit(): void {
    if (!this.user) {
      console.warn('Nincs bejelentkezett felhasználó!');
      // Itt esetleg átirányíthatod a login oldalra, ha használsz Router-t
    }
  }

  // Segédfüggvény a név kezdőbetűjéhez az avatarhoz
  getInitials(): string {
    return this.user?.name ? this.user.name.charAt(0).toUpperCase() : 'U';
  }

  logout() {
    localStorage.removeItem('user');
    window.location.reload(); // Vagy router.navigate
  }
}