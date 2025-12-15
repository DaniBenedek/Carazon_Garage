import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { AuthService } from '../../services/auth';

@Component({
  selector: 'app-header',
  imports: [CommonModule, RouterModule],
  templateUrl: './header.html',
  styleUrl: './header.css',
})
export class Header {
   constructor(public auth: AuthService) {}

  get user() {
    return JSON.parse(localStorage.getItem('user') || 'null');
  }

  logout() {
    this.auth.logout();
  }
}
