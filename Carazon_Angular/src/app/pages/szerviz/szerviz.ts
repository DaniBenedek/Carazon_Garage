import { Component } from '@angular/core';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { API_URL } from '../../app.config';  // útvonalat igazítsd!

@Component({
  selector: 'app-szerviz',
  standalone: true,
  imports: [HttpClientModule],
  templateUrl: './szerviz.html',
  styleUrl: './szerviz.css',
})
export class Szerviz {
  
  cars: any[] = [];

  constructor(private http: HttpClient) {
    this.loadCars();
  }

  loadCars() {
    this.http.get(`${API_URL}/api/cars`).subscribe({
      next: (data: any) => {
        this.cars = data;
        console.log("Lekért autók:", data);
      },
      error: err => {
        console.error("API hiba:", err);
      }
    });
  }
}
