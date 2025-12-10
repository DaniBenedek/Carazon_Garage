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
  categories: string[] = ['All', 'Architectural', 'Sculpture', 'Relief', 'Furniture', 'Decorative'];
  selectedCategory: string = 'All';
  Focim = "Projekteink";
  FocimLeiras = "Néhány referenciamunkánk";
  Otlet = "Van egy otleted?";
  OtletLeiras = "Mi segitunk megvalositani";

  projects: Project[] = [
    {
      id: 1,
      title: "Sacred Oak Cathedral Doors",
      category: "Architectural",
      year: "2024",
      image: "https://images.pexels.com/photos/5711890/pexels-photo-5711890.jpeg?auto=compress&cs=tinysrgb&w=800",
      description: "Hand-carved entrance doors featuring intricate religious iconography and traditional European motifs.",
      materials: "Oak, Bronze accents",
      dimensions: "3.2m × 2.1m"
    },
    {
      id: 2,
      title: "Renaissance Wall Panel",
      category: "Relief",
      year: "2024",
      image: "https://images.pexels.com/photos/6714355/pexels-photo-6714355.jpeg?auto=compress&cs=tinysrgb&w=800",
      description: "Classical relief panel depicting mythological scenes with meticulous attention to period-accurate detail.",
      materials: "Walnut",
      dimensions: "1.8m × 1.2m"
    },
    {
      id: 3,
      title: "Modern Abstract Sculpture",
      category: "Sculpture",
      year: "2023",
      image: "https://images.pexels.com/photos/5974280/pexels-photo-5974280.jpeg?auto=compress&cs=tinysrgb&w=800",
      description: "Contemporary interpretation of natural forms, blending organic curves with geometric precision.",
      materials: "Cherry wood",
      dimensions: "1.5m height"
    },
    {
      id: 4,
      title: "Heritage Dining Table",
      category: "Furniture",
      year: "2023",
      image: "https://images.pexels.com/photos/5711877/pexels-photo-5711877.jpeg?auto=compress&cs=tinysrgb&w=800",
      description: "Bespoke dining table with hand-carved leg details and inlaid traditional patterns.",
      materials: "Mahogany, Maple inlay",
      dimensions: "2.4m × 1.1m"
    },
    {
      id: 5,
      title: "Garden Angel Statue",
      category: "Sculpture",
      year: "2023",
      image: "https://images.pexels.com/photos/5089243/pexels-photo-5089243.jpeg?auto=compress&cs=tinysrgb&w=800",
      description: "Life-sized guardian angel carved from a single piece of wood, weatherproofed for outdoor display.",
      materials: "Cedar",
      dimensions: "1.9m height"
    },
    {
      id: 6,
      title: "Baroque Mirror Frame",
      category: "Decorative",
      year: "2022",
      image: "https://images.pexels.com/photos/6492398/pexels-photo-6492398.jpeg?auto=compress&cs=tinysrgb&w=800",
      description: "Ornate mirror frame inspired by 18th-century European design with gilded accents.",
      materials: "Lime wood, Gold leaf",
      dimensions: "1.2m × 0.9m"
    },
    {
      id: 7,
      title: "Celtic Cross Memorial",
      category: "Architectural",
      year: "2022",
      image: "https://images.pexels.com/photos/5711890/pexels-photo-5711890.jpeg?auto=compress&cs=tinysrgb&w=800",
      description: "Traditional Celtic cross with intricate knotwork and symbolic engravings for cemetery installation.",
      materials: "Oak",
      dimensions: "2.5m height"
    },
    {
      id: 8,
      title: "Wildlife Relief Series",
      category: "Relief",
      year: "2022",
      image: "https://images.pexels.com/photos/5974280/pexels-photo-5974280.jpeg?auto=compress&cs=tinysrgb&w=800",
      description: "Collection of three wildlife panels featuring native Hungarian fauna in their natural habitat.",
      materials: "Beech",
      dimensions: "0.8m × 0.6m each"
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