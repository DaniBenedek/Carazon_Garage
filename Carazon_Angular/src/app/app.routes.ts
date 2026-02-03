import { Routes } from '@angular/router';
import { Career } from './pages/career/career';
import { History } from './pages/history/history';
import { HomeComponent } from './pages/home/home';
import { Login } from './pages/login/login';
import { Projects } from './pages/projects/projects';
import { Szerviz } from './pages/szerviz/szerviz';
import { Register } from './pages/register/register';
import { Profile } from './pages/profile/profile';
import { Contact } from './pages/contact/contact';
import { HrComponent } from './pages/hr/hr';

export const routes: Routes = [
  { path: 'Career', component: Career },
  { path: 'History', component: History },
  { path: '', component: HomeComponent },
  { path: 'Login', component: Login },
  { path: 'Register', component: Register },
  { path: 'Projects', component: Projects },
  { path: 'Szerviz', component: Szerviz },
  { path: 'Profile', component: Profile },
  { path: 'Hr', component: HrComponent },
  { path: 'Contact', component: Contact }
  
];
