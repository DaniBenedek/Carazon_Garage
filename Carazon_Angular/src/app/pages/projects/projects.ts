import { Component, OnInit, Signal, signal, } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';

interface Project {
  id: number;
  title: string;
  category: string;
  year: string;
  img: string;
  description: string;
  materials: string;
  dimensions: string;
}

@Component({
  selector: 'Projects',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './projects.html',
  styleUrls: ['./projects.css']
})

export class Projects implements OnInit {
  //cimeink
  Focim = "Néhány projektünk:";
  FocimLeiras = "Hátha megtetszik valami";
  Kartya_Reszletek = "Részletek"
  Otlet = "Van egy ötleted?"
  OtletLeiras = "Oszd meg velünk:"
  AlsoFoglalasGomb  = "Foglalj most!"
  Kontakt = "Elérésünk"

  //Valtozok
  categories: string[] = ['All', 'Autotuning', 'Kozmetika', 'Karosszéria munkák', 'Fényezés', 'Hegesztés'];
  KivalasztottElem: string = 'All';

  projects: Project[] = [];
  Szurtmunka = signal<Project[]>([]);
  kivalasztottMunka: Project | null = null;

  // HttpClient beinjektálása az API hívásokhoz
  constructor(private http: HttpClient) {}

  ngOnInit(): void {

    // Projektek lekérése a backend API-ból
    this.http.get<Project[]>('http://localhost:3000/api/projects')
      .subscribe(data => {

        // Teljes projekt lista eltárolása
        this.projects = data;

        // Kezdetben minden projekt megjelenik (Mar ha betolt addigra)
        this.Szurtmunka.set(data);

      });
  }

  SzuresKategoriaSzerint(category: string): void {

    // Kiválasztott kategória frissítése
    this.KivalasztottElem = category;

    // ez amugy egy if else ha all akkor minden ha : akkor meg csak az adott kategoria
    this.Szurtmunka.set(category === 'All'
      ? this.projects
      : this.projects.filter(p => p.category === category));
  }

  // Kiválasztja a megadott projektet és felpörget az oldal tetejére
  viewProjectDetails(project: Project):void {
    this.kivalasztottMunka = project;
    window.scrollTo({top: 0, behavior: 'smooth'});
  }

    // Változó a kiválasztott projekt tárolásához
  selectedProject: any = null;
  
  // Modal megnyitása
  Projektreszletek(project: any) {
    this.selectedProject = project;
    // Letiltjuk a görgetést a háttérben, amíg nyitva a modal
    document.body.style.overflow = 'hidden';
  }
  
  // Modal bezárása
  closeModal() {
    this.selectedProject = null;
    // Visszaállítjuk a görgetést
    document.body.style.overflow = 'auto';
}


}
