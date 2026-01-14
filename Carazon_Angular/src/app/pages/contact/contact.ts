import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
  selector: 'app-contact',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './contact.html'
})
export class Contact implements OnInit {
  contactForm!: FormGroup;
  isSubmitting = false;
  successMessage = false;

  // Autószerelő specifikus szövegek
  contactTitle = 'Lépjen kapcsolatba velünk';
  contactDesc = 'Kérdése van? Hibajelenséget tapasztal? Írjon nekünk, és szakembereink hamarosan válaszolnak.';

  constructor(private fb: FormBuilder) {}

  ngOnInit(): void {
    this.contactForm = this.fb.group({
      name: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      phone: ['', [Validators.required]], // Autószerviznél a telefon kritikus!
      carModel: [''], // Opcionális: Milyen autóval kapcsolatban keresnek
      message: ['', [Validators.required, Validators.minLength(10)]]
    });
  }

  SendMessage() {
    if (this.contactForm.valid) {
      this.isSubmitting = true;
      console.log('Küldés...', this.contactForm.value);
      
      // Szimuláció
      setTimeout(() => {
        this.isSubmitting = false;
        this.successMessage = true;
        this.contactForm.reset();
      }, 2000);
    }
  }
}