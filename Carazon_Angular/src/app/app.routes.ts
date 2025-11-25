import { Routes } from '@angular/router';
import { Szerviz } from './pages/szerviz/szerviz';
import { Login } from './pages/login/login';
import { Home } from './pages/home/home';

export const routes: Routes = [
  { path: 'Szerviz', component: Szerviz },
  { path: 'Login', component: Login },
  { path: '', component: Home }
];
