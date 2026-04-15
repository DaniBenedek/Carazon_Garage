import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../services/auth';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './login.html',
  styleUrl: './login.css',
})
export class Login {
  email = '';
  password = '';
  error = signal(""); 

  constructor(
    private auth: AuthService, 
    private router: Router
  ) {}

  isPasswordVisible: boolean = false;
  togglePassword() {
    this.isPasswordVisible = !this.isPasswordVisible;
  }

  login() {
    this.auth.login(this.email, this.password).subscribe({
      next: () => {
        // Ha sikeres azonnal átirányít
        this.router.navigate(['/Profile']);
      },
      error: () => {
        // Ha sikertelen beállítjuk a kért szöveget
        this.error.set('Hibás Email vagy jelszó');
      }
    });
  }
}