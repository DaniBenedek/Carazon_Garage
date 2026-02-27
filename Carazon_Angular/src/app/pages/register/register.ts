import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { HttpClient, HttpClientModule } from '@angular/common/http';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [
    FormsModule, 
    CommonModule,
    HttpClientModule
  ],
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
  
  constructor(private http: HttpClient) {}

  togglePassword() {
    this.isPasswordVisible = !this.isPasswordVisible;
  }

  onSubmit() {
    const payload = {
      name: this.regData.name,
      email: this.regData.email,
      password: this.regData.password,
      phone_number: this.regData.phone
    };


    this.http.post('http://localhost:3000/api/register', payload)
      .subscribe({
        next: (response: any) => {
          console.log('Szerver válasza:', response);
          alert('Sikeres regisztráció!');

        },
        error: (error) => {
          console.error('Hiba történt:', error);
          alert(error.error?.message || 'Hiba történt a regisztráció során.');
        }
      });
  }
}