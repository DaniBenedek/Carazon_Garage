import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface HeroData {
  heroTitle: string;
  heroSubtitle: string;
  heroDescription: string;
}

@Injectable({
  providedIn: 'root',
})
export class HeroService {
  private httpClient = inject(HttpClient);
  private apiUrl = 'http://localhost/Carazon_Garage/api/getData.php';

  getHeroData(): Observable<HeroData> {
    return this.httpClient.get<HeroData>(this.apiUrl);
  }
}
