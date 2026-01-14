import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common'; // Az *ngIf miatt kell

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [FormsModule, CommonModule], // Mindkettő kell ide
  templateUrl: './register.html',
  styleUrl: './register.css',
})
export class Register {
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

  onSubmit() {
    if (this.regData.password === this.regData.confirmPassword) {
      console.log('Sikeres regisztráció adatai:', this.regData);
    } else {
      console.error('Hiba: A jelszavak nem egyeznek!');
    }
  }
}