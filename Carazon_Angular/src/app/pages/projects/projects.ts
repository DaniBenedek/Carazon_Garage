import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

interface Project {
  id: number;
  title: string;
  category: string;
  year: string;
  image: string;
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
  categories: string[] = ['All', 'Autotuning', 'Kozmetika', 'Karosszéria munkák', 'Fényezés', 'Hegesztés'];
  KivalasztottElem: string = 'All';
  Focim = "Projekteink";
  FocimLeiras = "Néhány referenciamunkánk";
  Otlet = "Van egy otleted?";
  OtletLeiras = "Mi segitunk megvalositani";
  AlsoFoglalasGomb = "Megrendelés indítása";
  Kontakt = "Kapcsolatfelvétel";
  Kartya_Reszletek = "Részletek";

  projects: Project[] = [
    {
      id: 1,
      title: "Lowrider Légzsák",
      category: "Autotuning",
      year: "2024",
      image: "https://images.pexels.com/photos/242125/pexels-photo-242125.jpeg",
      description: "Pattog az autó mint a labda.",
      materials: "Légzsák, rúgó",
      dimensions: "4-6 óra"
    },
    {
      id: 2,
      title: "Mercedes bőrözés",
      category: "Kozmetika",
      year: "2024",
      image: "https://images.pexels.com/photos/1104768/pexels-photo-1104768.jpeg",
      description: "Teljes kabintéri bőrözés.",
      materials: "Bőr, cérna, alkantara",
      dimensions: "6-8 óra"
    },
    {
      id: 3,
      title: "Renault Clio Fényezés",
      category: "Fényezés",
      year: "2023",
      image: "https://miraclebodyandpaint.com/wp-content/uploads/2022/02/Auto-Paint-job-4-1200x480.jpg",
      description: "Renault clio fényezés korrekció, és újrafújás.",
      materials: "Festék, edző, hígító",
      dimensions: "20-22 óra"
    },
    {
      id: 4,
      title: "Autó Sárvédőív lakatolás",
      category: "Hegesztés",
      year: "2023",
      image: "https://mot-centre.com/wp-content/uploads/2016/01/0907phr_07_z1971_mopar_muscle_carwelding_rivet_holes.jpg",
      description: "Rozsda eltávolítása, lakatolás.",
      materials: "Co2 gáz, 0.8mm -es huzal",
      dimensions: "Kabintér"
    },
    {
      id: 5,
      title: "Amerikai v8 építés",
      category: "Autotuning",
      year: "2023",
      image: "https://images.pexels.com/photos/3076820/pexels-photo-3076820.jpeg",
      description: "Teljes körű motor építés",
      materials: "Hengerfej, nyomórudak, szíjjak",
      dimensions: "48-52 óra"
    },
    {
      id: 6,
      title: "Porsche 911 Gt3 Ponthegesztés",
      category: "Hegesztés",
      year: "2022",
      image: "https://global.toyota/pages/global_toyota/company/plant-tours/welding_ogp_001.jpg",
      description: "Porsche kasztni hegesztés.",
      materials: "Co2 gáz, 0.8mm huzal",
      dimensions: "120-250 óra"
    },
    {
      id: 7,
      title: "Mazda miata",
      category: "Karosszéria munkák",
      year: "2022",
      image: "https://www.toptreadtyres.co.uk/wp-content/uploads/2019/09/BodyWork.png",
      description: "Egyedi szélesítés a jobb úttartás érdekében.",
      materials: "üvegszál, epoxy",
      dimensions: "52-55 óra"
    },
    {
      id: 8,
      title: "Mercedes beltér",
      category: "Kozmetika",
      year: "2022",
      image: "https://images.pexels.com/photos/193999/pexels-photo-193999.jpeg",
      description: "Egyedi bőrfestés húzatolással",
      materials: "Festék, alkantara, bőr",
      dimensions: "50-55"
    }
  ];



  Szurtmunka: Project[] = [];

  ngOnInit(): void {
    this.Szurtmunka = this.projects;
  }

  SzuresKategoriaSzerint(category: string): void {
    this.KivalasztottElem = category;
    if (category === 'All') {
      this.Szurtmunka = this.projects;
    } else {
      this.Szurtmunka = this.projects.filter(p => p.category === category);
    }
  }

  Projektreszletek(project: Project): void {
    console.log('View project:', project);    
  }
}