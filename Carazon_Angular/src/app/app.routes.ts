import { Routes } from '@angular/router';
import { Career } from './pages/career/career';
import { HomeComponent } from './pages/home/home';
import { Login } from './pages/login/login';
import { Projects } from './pages/projects/projects';
import { Szerviz } from './pages/szerviz/szerviz';
import { Register } from './pages/register/register';
import { Profile } from './pages/profile/profile';
import { Contact } from './pages/contact/contact';
import { Hr } from './pages/hr/hr';
import { Gallery } from './pages/gallery/gallery';

export const routes: Routes = [
  { path: 'Career', component: Career },
  { path: '', component: HomeComponent },
  { path: 'Login', component: Login },
  { path: 'Register', component: Register },
  { path: 'Projects', component: Projects },
  { path: 'Szerviz', component: Szerviz },
  { path: 'Profile', component: Profile },
  { path: 'Gallery', component: Gallery },
  { path: 'Hr', component: Hr },
  { path: 'Contact', component: Contact }
  
];
