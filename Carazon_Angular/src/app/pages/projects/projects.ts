import { Component, OnInit } from '@angular/core';
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
  Focim = "helloszia";
  FocimLeiras = "csao";
  Kartya_Reszletek = "Részletek"
  Otlet = "Van egy ötleted?"
  OtletLeiras = "asd"
  AlsoFoglalasGomb  = "asd"
  Kontakt = "kk"

  categories: string[] = ['All', 'Autotuning', 'Kozmetika', 'Karosszéria munkák', 'Fényezés', 'Hegesztés'];
  KivalasztottElem: string = 'All';

  projects: Project[] = [];
  Szurtmunka: Project[] = [];
  kivalasztottMunka: Project | null = null;

  constructor(private http: HttpClient) {}

  ngOnInit(): void {
    this.http.get<Project[]>('http://localhost:3000/api/projects')
      .subscribe(data => {
        this.projects = data;
        this.Szurtmunka = data;
      });
  }

  SzuresKategoriaSzerint(category: string): void {
    this.KivalasztottElem = category;

    this.Szurtmunka = category === 'All'
      ? this.projects
      : this.projects.filter(p => p.category === category);
  }

  viewProjectDetails(project: Project):void {
    this.kivalasztottMunka = project;
    window.scrollTo({top: 0, behavior: 'smooth'});
  }

  Projektreszletek(project: Project):void {
    console.log('asd',project)
  }
}
