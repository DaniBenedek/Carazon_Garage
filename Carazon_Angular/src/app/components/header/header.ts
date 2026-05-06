import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { AuthService } from '../../services/auth';

@Component({
  selector: 'app-header',
  standalone: true, 
  imports: [CommonModule, RouterModule],
  templateUrl: './header.html',
  styleUrl: './header.css',
})
export class Header {

  isMenuOpen = false;         
  isUserDropdownOpen = false;   

  constructor(public auth: AuthService) {}

  get user() {
    return JSON.parse(localStorage.getItem('carazongarage_user') || 'null');
  }


  // Új getter az admin jogosultság ellenőrzéséhez
  get isAdmin(): boolean {
    const currentUser = this.user;
    // Feltételezve, hogy az adatbázisodban/tokenedben 'role' vagy 'isAdmin' mező van
    return currentUser && (currentUser.role === 'admin' || currentUser.isAdmin === true);
  }
  
  // Meglévő metódusok
  toggleMenu() {
    this.isMenuOpen = !this.isMenuOpen;
    if (this.isMenuOpen) this.isUserDropdownOpen = false;
  }

  closeMenu() {
    this.isMenuOpen = false;
    this.isUserDropdownOpen = false; // Mindent bezár
  }

  // Profil dropdown kapcsoló
  toggleUserDropdown() {
    this.isUserDropdownOpen = !this.isUserDropdownOpen;

    if (this.isUserDropdownOpen) this.isMenuOpen = false;
  }

  logout() {
    this.auth.logout();
    this.closeMenu(); 
    location.reload();
  }
}