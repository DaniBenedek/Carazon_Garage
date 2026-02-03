import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { JobService } from '../../services/job';

@Component({
  selector: 'app-hr',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './hr.html'
})
export class Hr implements OnInit {
  private jobService = inject(JobService);

  jobs: any[] = [];
  
  // Ezt a változót keresi a HTML a @if-nél és a @for-nál
  selectedJobForReview: any[] = []; 
  selectedJobTitle: string = '';

  newJob = {
    title: '',
    description: '',
    salary: '',
    location: 'Makó'
  };

  ngOnInit() {
    this.loadJobs();
  }

  loadJobs() {
    this.jobService.getJobs().subscribe(data => {
      this.jobs = data;
    });
  }

  addJob() {
    if (!this.newJob.title || !this.newJob.description) return;
    this.jobService.postJob(this.newJob).subscribe(() => {
      this.loadJobs();
      this.newJob = { title: '', description: '', salary: '', location: 'Makó' };
      alert('Sikeresen közzétéve!');
    });
  }

  viewApplicants(jobId: number, jobTitle: string) {
    this.selectedJobTitle = jobTitle;
    this.jobService.getApplicants(jobId).subscribe(data => {
      // Itt töltjük be a választott jelentkezőket
      this.selectedJobForReview = data;
      
      setTimeout(() => {
        document.getElementById('applicants-section')?.scrollIntoView({ behavior: 'smooth' });
      }, 100);
    });
  }
}