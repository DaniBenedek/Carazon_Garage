import { ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';

import { Projects } from './projects';

describe('Projects', () => {
	let component: Projects;
	let fixture: ComponentFixture<Projects>;

	beforeEach(async () => {
		await TestBed.configureTestingModule({
			imports: [Projects]
		}).compileComponents();

		fixture = TestBed.createComponent(Projects);
		component = fixture.componentInstance;
		fixture.detectChanges();
	});

	it('Letre kene hozza a komponenst', () => {
		expect(component).toBeTruthy();
	});

	it('Ki kene festenie a nagy szoveget', () => {
		const title = fixture.debugElement.query(By.css('.projects-hero h1'));
		expect(title).toBeTruthy();
		expect(title.nativeElement.textContent).toContain('Projekteink');
	});

	it('Bekelenne toltenie a Szurtmunka valtozot a projektekkel', () => {
		expect(component.Szurtmunka.length).toBeGreaterThan(0);
		expect(component.Szurtmunka.length).toBe(component.projects.length);
	});

	it('Kikene szurnie a projekteket kategoriak alapjan', () => {
		component.SzuresKategoriaSzerint('Sculpture');
		expect(component.KivalasztottElem).toBe('Sculpture');
		expect(component.Szurtmunka.every(p => p.category === 'Sculpture')).toBeTrue();
	});

	it('Megkene nyitnia a projektreszleteket ha rakattintanak a reszletekre', () => {
		spyOn(component, 'Projektreszletek');

		const firstCard = fixture.debugElement.query(By.css('.project-card'));
		expect(firstCard).toBeTruthy();
		firstCard.triggerEventHandler('click', null);

		expect(component.Projektreszletek);
	});
});

