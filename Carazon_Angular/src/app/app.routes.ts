import { Routes } from '@angular/router';
import { Carrer } from './pages/carrer/carrer';
import { History } from './pages/history/history';
import { HomeComponent } from './pages/home/home';
import { Login } from './components/login/login';
import { Projects } from './pages/projects/projects';
import { Szerviz } from './pages/szerviz/szerviz';

export const routes: Routes = [
  { path: 'Carrer', component: Carrer },
  { path: 'History', component: History },
  { path: '', component: HomeComponent },
  { path: 'Login', component: Login },
  { path: 'Projects', component: Projects },
  { path: 'Szerviz', component: Szerviz }
];
