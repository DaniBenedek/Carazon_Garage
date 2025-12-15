import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

interface JobPosition {
  id: number;
  title: string;
  department: string;
  type: string;
  location: string;
  experience: string;
  posted: string;
  description: string;
  responsibilities: string[];
  requirements: string[];
  niceToHave?: string[];
  benefits?: string[];
}

@Component({
  selector: 'Career',
  standalone: true,
  imports: [CommonModule],
  templateUrl: 'carrer.html',
  styleUrls: ['carrer.css']
})
export class Career implements OnInit {
  selectedDepartment: string = 'All';
  departments: string[] = ['All', 'Craftsmanship', 'Design', 'Business', 'Apprenticeship'];
  
  positions: JobPosition[] = [
    {
      id: 1,
      title: "Master Wood Carver",
      department: "Craftsmanship",
      type: "Full-time",
      location: "Makó, Hungary",
      experience: "5+ years",
      posted: "2 weeks ago",
      description: "Join our team of master artisans to create exceptional wood carvings for prestigious clients worldwide.",
      responsibilities: [
        "Execute complex wood carving projects from concept to completion",
        "Collaborate with design team to interpret client visions",
        "Mentor junior carvers and apprentices",
        "Maintain traditional techniques while exploring innovative approaches",
        "Ensure quality standards are met on all projects"
      ],
      requirements: [
        "Minimum 5 years of professional wood carving experience",
        "Proficiency in traditional hand-carving techniques",
        "Strong understanding of wood properties and selection",
        "Ability to read and interpret technical drawings",
        "Portfolio demonstrating range and quality of work"
      ],
      niceToHave: [
        "Experience with architectural restoration",
        "Knowledge of gilding and finishing techniques",
        "Sculpture or fine arts background"
      ],
      benefits: [
        "Competitive salary based on experience",
        "Work on prestigious international projects",
        "Professional development opportunities",
        "Creative freedom and artistic expression",
        "Health insurance"
      ]
    },
    {
      id: 2,
      title: "Wood Carving Apprentice",
      department: "Apprenticeship",
      type: "Apprenticeship",
      location: "Makó, Hungary",
      experience: "No experience required",
      posted: "1 week ago",
      description: "Learn the timeless art of wood carving under the guidance of master craftsmen. This is a rare opportunity to develop skills that few possess.",
      responsibilities: [
        "Learn fundamental wood carving techniques and tool handling",
        "Assist master carvers with project preparation and execution",
        "Maintain workshop tools and equipment",
        "Study wood species, grain patterns, and material properties",
        "Progress from basic to complex carving tasks under supervision"
      ],
      requirements: [
        "Genuine passion for traditional craftsmanship",
        "Strong attention to detail and patience",
        "Physical ability to work with hand tools for extended periods",
        "Willingness to commit to multi-year apprenticeship",
        "Basic understanding of woodworking is helpful but not required"
      ],
      niceToHave: [
        "Background in art, sculpture, or woodworking",
        "Carpentry experience",
        "Strong drawing or design skills"
      ],
      benefits: [
        "Comprehensive training by master craftsmen",
        "Stipend during apprenticeship period",
        "Hands-on experience with prestigious projects",
        "Career path to master carver position",
        "Certificate of completion"
      ]
    },
    {
      id: 3,
      title: "Design & Project Coordinator",
      department: "Design",
      type: "Full-time",
      location: "Makó, Hungary / Remote",
      experience: "3+ years",
      posted: "3 weeks ago",
      description: "Bridge the gap between client vision and craftsman execution. Work closely with clients and our carving team to bring exceptional projects to life.",
      responsibilities: [
        "Consult with clients to understand project requirements and vision",
        "Create detailed design proposals and technical drawings",
        "Coordinate project timelines and resource allocation",
        "Communicate progress updates to clients",
        "Ensure projects meet quality standards and client expectations"
      ],
      requirements: [
        "3+ years in project coordination or design role",
        "Strong communication and client management skills",
        "Proficiency in design software (AutoCAD, SketchUp, or similar)",
        "Understanding of woodworking processes and limitations",
        "Excellent organizational and time management skills"
      ],
      niceToHave: [
        "Background in architecture or interior design",
        "Experience in custom furniture or artisan industries",
        "Knowledge of traditional European design styles",
        "Multilingual capabilities (Hungarian, English, German)"
      ],
      benefits: [
        "Hybrid work arrangement available",
        "Collaborative creative environment",
        "Competitive salary package",
        "Professional development budget",
        "Work with high-profile clients"
      ]
    },
    {
      id: 4,
      title: "Workshop Assistant",
      department: "Craftsmanship",
      type: "Part-time",
      location: "Makó, Hungary",
      experience: "1-2 years",
      posted: "1 month ago",
      description: "Support our master carvers by maintaining the workshop, preparing materials, and assisting with various stages of projects.",
      responsibilities: [
        "Prepare wood materials for carving projects",
        "Maintain and sharpen workshop tools",
        "Keep workshop organized and clean",
        "Assist carvers with project setup and material handling",
        "Document project progress with photography"
      ],
      requirements: [
        "1-2 years of woodworking or workshop experience",
        "Knowledge of wood species and properties",
        "Tool maintenance skills",
        "Physical ability to lift and move materials",
        "Reliable and detail-oriented"
      ],
      niceToHave: [
        "Carpentry background",
        "Interest in developing carving skills",
        "Photography skills"
      ],
      benefits: [
        "Flexible part-time schedule",
        "Learn from master craftsmen",
        "Opportunity to advance to apprentice position",
        "Hands-on experience with prestigious projects"
      ]
    },
    {
      id: 5,
      title: "Business Development Manager",
      department: "Business",
      type: "Full-time",
      location: "Makó, Hungary / Remote",
      experience: "5+ years",
      posted: "2 days ago",
      description: "Drive growth by building relationships with galleries, architects, interior designers, and collectors who value exceptional craftsmanship.",
      responsibilities: [
        "Develop and execute business development strategy",
        "Build relationships with architects, designers, and collectors",
        "Identify and pursue new market opportunities",
        "Represent the brand at trade shows and exhibitions",
        "Collaborate with marketing team on promotional initiatives"
      ],
      requirements: [
        "5+ years in business development or sales (luxury/artisan sector preferred)",
        "Proven track record of building client relationships",
        "Strong understanding of luxury goods or art market",
        "Excellent presentation and negotiation skills",
        "Fluent in English and Hungarian"
      ],
      niceToHave: [
        "Network in architecture or interior design industry",
        "Experience in European luxury goods market",
        "Additional languages (German, French)",
        "Background in art, design, or craftsmanship"
      ],
      benefits: [
        "Competitive salary plus performance bonuses",
        "Travel opportunities to exhibitions and client meetings",
        "Represent world-class craftsmanship",
        "Flexible work arrangement",
        "Professional development support"
      ]
    }
  ];

  filteredPositions: JobPosition[] = [];
  selectedPosition: JobPosition | null = null;

  ngOnInit(): void {
    this.filteredPositions = this.positions;
  }

  filterByDepartment(department: string): void {
    this.selectedDepartment = department;
    if (department === 'All') {
      this.filteredPositions = this.positions;
    } else {
      this.filteredPositions = this.positions.filter(p => p.department === department);
    }
  }

  viewJobDetails(position: JobPosition): void {
    this.selectedPosition = position;
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  applyForJob(position: JobPosition): void {
    console.log('Apply for:', position.title);
    // Navigate to application form or open modal
  }

  closeJobDetails(): void {
    this.selectedPosition = null;
  }
}