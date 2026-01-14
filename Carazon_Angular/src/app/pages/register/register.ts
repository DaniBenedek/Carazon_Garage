import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms'; // Kell a form validációhoz és az ngModel-hez
import { CommonModule } from '@angular/common'; // Kell az *ngIf hibaüzenethez

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [
    FormsModule, 
    CommonModule
  ],
  templateUrl: './register.html',
  styleUrl: './register.css',
})
export class Register {
  // Ebben az objektumban tároljuk az űrlap adatait
  regData = {
    name: '',
    email: '',
    phone: '',
    password: '',
    confirmPassword: ''
  };

  isPasswordVisible: boolean = false;
  
  togglePassword() {
    this.isPasswordVisible = !this.isPasswordVisible;
  }

  // Ez a függvény fut le a Regisztráció gomb megnyomásakor
  onSubmit() {
    // Itt íratjuk ki az adatokat a konzolra
    console.log('Sikeres regisztráció! Az adatok:');
    console.log('Név:', this.regData.name);
    console.log('Email:', this.regData.email);
    console.log('Telefon:', this.regData.phone);
    console.log('Jelszó:', this.regData.password);
  }
}