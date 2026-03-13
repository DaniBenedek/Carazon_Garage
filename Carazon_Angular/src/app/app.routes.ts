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

import { GalleryOverview } from './pages/gallery-overview/gallery-overview';
import { ProjectGallery } from './pages/project-gallery/project-gallery';

export const routes: Routes = [

  { path: '', component: HomeComponent },

  { path: 'career', component: Career },
  { path: 'login', component: Login },
  { path: 'register', component: Register },

  { path: 'projects', component: Projects },
  { path: 'szerviz', component: Szerviz },

  { path: 'profile', component: Profile },
  { path: 'hr', component: Hr },
  { path: 'contact', component: Contact },

  // GALÉRIA OLDAL
  { path: 'referenciak', component: GalleryOverview },

  // PROJEKT OLDAL
  { path: 'project/:categorySlug', component: ProjectGallery },

  // ha nincs ilyen route → vissza a főoldalra
  { path: '**', redirectTo: '' }

];