import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({ providedIn: 'root' })
export class JobService {
  private http = inject(HttpClient);
  private apiUrl = 'http://localhost:3000/api';

  getJobs() { return this.http.get<any[]>(`${this.apiUrl}/jobs`); }
  
  postJob(jobData: any) { return this.http.post(`${this.apiUrl}/jobs`, jobData); }
  
  apply(application: any) { return this.http.post(`${this.apiUrl}/apply`, application); }
  
  getApplicants(jobId: number) { return this.http.get<any[]>(`${this.apiUrl}/applicants/${jobId}`); }
}