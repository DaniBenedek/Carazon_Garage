import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';


@Component({
  selector: 'app-history',
  imports: [CommonModule],
  templateUrl: './history.html',
  styleUrl: './history.css',
})
export class History {
 vehicles = signal<any[]>([]);
  loading = signal(true);
  error = signal('');

  constructor() {
    this.load();
  }

  async load() {
    try {
      const res = await fetch('http://localhost:3000/api/vehicle');

      if (!res.ok) {
        throw new Error('HTTP hiba');
      }

      const data = await res.json();
      this.vehicles.set(data);

    } catch (e) {
      console.error(e);
      this.error.set('Nem sikerült betölteni az adatokat');
    } finally {
      this.loading.set(false);
    }
  }
}