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
  user = JSON.parse(localStorage.getItem('carazongarage_user') || 'null');

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
    }
  }

  getInitials(): string {
    return this.user?.name ? this.user.name.charAt(0).toUpperCase() : 'U';
  }

  logout() {
    localStorage.removeItem('carazongarage_user');
    window.location.reload();
  }
}