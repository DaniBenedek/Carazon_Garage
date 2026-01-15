import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { AuthService } from '../../services/auth';

@Component({
  selector: 'app-header',
  standalone: true, // Biztosítja, hogy az imports rész működjön
  imports: [CommonModule, RouterModule],
  templateUrl: './header.html',
  styleUrl: './header.css',
})
export class Header {

  isMenuOpen = false;           // Mobil menü állapota
  isUserDropdownOpen = false;   // Profil dropdown állapota

  constructor(public auth: AuthService) {}

  get user() {
    return JSON.parse(localStorage.getItem('user') || 'null');
  }

  // Meglévő metódusaid
  toggleMenu() {
    this.isMenuOpen = !this.isMenuOpen;
    // Ha a mobil menüt nyitjuk, zárjuk be a profilt
    if (this.isMenuOpen) this.isUserDropdownOpen = false;
  }

  closeMenu() {
    this.isMenuOpen = false;
    this.isUserDropdownOpen = false; // Minden menüt bezárunk
  }

  // ÚJ: Profil dropdown kapcsoló
  toggleUserDropdown() {
    this.isUserDropdownOpen = !this.isUserDropdownOpen;
    // Ha a profilt nyitjuk, zárjuk be a mobil menüt
    if (this.isUserDropdownOpen) this.isMenuOpen = false;
  }

  logout() {
    this.auth.logout();
    this.closeMenu(); 
  }
}