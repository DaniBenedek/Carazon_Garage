import { Component, OnInit, inject } from '@angular/core';
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

  jobs: any[] = [];
  selectedJob: any = null;

  application = {
    name: '',
    email: '',
    message: ''
  };

  ngOnInit() {
    this.loadJobs();
  }

  loadJobs() {
    this.jobService.getJobs().subscribe(data => {
      this.jobs = data;
    });
  }

  selectJob(job: any) {
    this.selectedJob = job;
    this.application = { name: '', email: '', message: '' };
  }

  submitApplication() {
    const data = {
      job_id: this.selectedJob.id,
      ...this.application
    };

    this.jobService.apply(data).subscribe({
      next: () => {
        alert('Sikeres jelentkezés! Hamarosan keressük.');
        this.selectedJob = null;
      },
      error: () => alert('Hiba történt a küldés során.')
    });
  }
}