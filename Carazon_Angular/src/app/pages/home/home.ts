import { Component} from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './home.html',
  styleUrls: ['./home.css']
})
export class HomeComponent {

  // Hatlamas Szoveg fooldalt
  heroTitle = 'Carazon Garage';
  heroSubtitle = 'Ahonnan a jo otletek szarmaznak';
  heroDescription = 'Foglalj most';

  Idopontfoglalas() {
    console.log('Idopontot foglalok')
  };
  Munkaink() {
    console.log('Munkaink megtekintese')
  };
}
