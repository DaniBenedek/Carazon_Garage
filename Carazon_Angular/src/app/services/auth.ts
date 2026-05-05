import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { tap } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://localhost:3000/api';

  constructor(private http: HttpClient) {}

  // Paraméterként emailt és jelszót kap
  login(email: string, password: string) {

  // Régi adatok törlése
  localStorage.clear();

  return this.http.post<any>(`${this.apiUrl}/login`, {
    email,
    password
  }).pipe(
    tap(res => {

      // Új user mentése
      localStorage.setItem('carazongarage_user', JSON.stringify(res.user));
    })
  );
}

  // ha bevan jelentkezve false ha igen true
  isLoggedIn(): boolean {
    return !!localStorage.getItem('carazongarage_user');
  }

  //Kijelentkezesnel torli a felhasznalo adatait
  logout() {
    localStorage.removeItem('carazongarage_user');
  }
}
