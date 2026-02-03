import { Component, OnInit, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { JobService } from '../../services/job';

@Component({
  selector: 'app-career',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './career.html',
  styleUrl: './career.css',
})
export class Career implements OnInit {
  private jobService = inject(JobService);

  jobs = signal<any[]>([]);
  selectedJob = signal<any>(null);

  application = {
    name: '',
    email: '',
    message: ''
  };

  ngOnInit() {
    this.loadJobs();
  }

  loadJobs() {
    this.jobService.getJobs().subscribe({
      next: (data) => {
        this.jobs.set(data);
      },
      error: (err) => console.error('Hiba a betöltésnél:', err)
    });
  }

  selectJob(job: any) {
    this.selectedJob.set(job);
    this.application = { name: '', email: '', message: '' };
  }

  submitApplication() {
    const currentJob = this.selectedJob();
    
    if (!currentJob) return;

    const data = {
      job_id: currentJob.id,
      ...this.application
    };

    this.jobService.apply(data).subscribe({
      next: () => {
        alert('Sikeres jelentkezés! Hamarosan keressük.');
        this.selectedJob.set(null);
      },
      error: () => alert('Hiba történt a küldés során.')
    });
  }
}