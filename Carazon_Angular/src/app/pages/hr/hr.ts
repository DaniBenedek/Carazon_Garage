import { Component, OnInit, inject, signal } from '@angular/core';
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

  jobs = signal<any[]>([]);
  selectedJobForReview = signal<any[]>([]);
  selectedJobTitle = signal<string>('');

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
    this.jobService.getJobs().subscribe({
      next: (data) => this.jobs.set(data),
      error: (err) => console.error('Hiba:', err)
    });
  }

  addJob() {
    if (!this.newJob.title || !this.newJob.description) return;
    
    this.jobService.postJob(this.newJob).subscribe({
      next: () => {
        this.loadJobs();
        this.newJob = { title: '', description: '', salary: '', location: 'Makó' };
        alert('Sikeresen közzétéve!');
      }
    });
  }

  viewApplicants(jobId: number, jobTitle: string) {
    this.selectedJobTitle.set(jobTitle);
    this.jobService.getApplicants(jobId).subscribe({
      next: (data) => {
        this.selectedJobForReview.set(data);
        

        setTimeout(() => {
          document.getElementById('applicants-section')?.scrollIntoView({ behavior: 'smooth' });
        }, 100);
      }
    });
  }
}