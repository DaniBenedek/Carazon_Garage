import { Routes } from '@angular/router';
import { Szerviz } from './pages/szerviz/szerviz';
import { Home } from './pages/home/home';

export const routes: Routes = [
  { path: 'Szerviz', component: Szerviz },
  { path: '', component: Home }
];
