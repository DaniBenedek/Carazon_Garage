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
  selectedCategory: string = 'All';
  Focim = "Projekteink";
  FocimLeiras = "Néhány referenciamunkánk";
  Otlet = "Van egy otleted?";
  OtletLeiras = "Mi segitunk megvalositani";
  AlsoFoglalasGomb = "Megrendelés indítása";
  Kontakt = "Kapcsolatfelvétel";

  projects: Project[] = [
    {
      id: 1,
      title: "Ferrari Testarossa Restoration",
      category: "Autotuning",
      year: "2024",
      image: "https://images.pexels.com/photos/358070/pexels-photo-358070.jpeg?auto=compress&cs=tinysrgb&w=800",
      description: "Teljes körű restaurálás ikonikus 80-as évekbeli Ferrari Testarossa modellen, eredeti alkatrészekkel.",
      materials: "Acél, Bőr belső",
      dimensions: "4.5m × 1.9m"
    },
    {
      id: 2,
      title: "BMW M3 Drift Kit",
      category: "Kozmetika",
      year: "2024",
      image: "https://images.pexels.com/photos/1149831/pexels-photo-1149831.jpeg?auto=compress&cs=tinysrgb&w=800",
      description: "Speciális drift átalakítás BMW M3-hoz, megerősített futóművel és sport kipufogóval.",
      materials: "Alumínium, Karbon",
      dimensions: "4.4m × 2.0m"
    },
    {
      id: 3,
      title: "Tesla Cybertruck Concept Wrap",
      category: "Fényezés",
      year: "2023",
      image: "https://images.pexels.com/photos/19052331/pexels-photo-19052331.jpeg",
      description: "Futurista fóliázás Cybertruck modellen, matt fekete és neon kék kombinációval.",
      materials: "Vinyl wrap",
      dimensions: "5.8m × 2.1m"
    },
    {
      id: 4,
      title: "Mercedes-Benz Luxury Interior",
      category: "Hegesztés",
      year: "2023",
      image: "https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg?auto=compress&cs=tinysrgb&w=800",
      description: "Exkluzív belső tér átalakítás prémium bőrrel és fa betétekkel.",
      materials: "Bőr, Diófa",
      dimensions: "Kabintér"
    },
    {
      id: 5,
      title: "Nissan Patrol Off-Road Build",
      category: "Autotuning",
      year: "2023",
      image: "https://images.pexels.com/photos/2990837/pexels-photo-2990837.jpeg",
      description: "Teljes off-road átalakítás Nissan Patrolhoz, emelt futóművel, snorkellel és terepgumikkal.",
      materials: "Acél, Gumi",
      dimensions: "4.8m × 2.0m"
    },
    {
      id: 6,
      title: "Porsche 911 GT3 Aero Kit",
      category: "Hegesztés",
      year: "2022",
      image: "https://images.pexels.com/photos/358070/pexels-photo-358070.jpeg?auto=compress&cs=tinysrgb&w=800",
      description: "Aerodinamikai tuning csomag Porsche 911 GT3-hoz, karbon szárnyakkal és diffúzorral.",
      materials: "Karbon",
      dimensions: "4.6m × 1.8m"
    },
    {
      id: 7,
      title: "Ford Mustang Shelby Tribute",
      category: "Karosszéria munkák",
      year: "2022",
      image: "https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg?auto=compress&cs=tinysrgb&w=800",
      description: "Egyedi építés Shelby GT500 stílusban, ikonikus csíkozással és V8 motorral.",
      materials: "Acél, Alumínium",
      dimensions: "4.7m × 2.0m"
    },
    {
      id: 8,
      title: "Motorépítés",
      category: "Kozmetika",
      year: "2022",
      image: "https://images.pexels.com/photos/2027045/pexels-photo-2027045.jpeg",
      description: "Egyedi festés sorozat motorokra, street art és klasszikus stílusban.",
      materials: "Vas/Alumínium",
      dimensions: "2.1m × 0.9m"
    }
  ];



  filteredProjects: Project[] = [];

  ngOnInit(): void {
    this.filteredProjects = this.projects;
  }

  filterByCategory(category: string): void {
    this.selectedCategory = category;
    if (category === 'All') {
      this.filteredProjects = this.projects;
    } else {
      this.filteredProjects = this.projects.filter(p => p.category === category);
    }
  }

  viewProjectDetails(project: Project): void {
    console.log('View project:', project);
    // Navigate to project detail page or open modal
    // Example: this.router.navigate(['/projects', project.id]);
  }
}