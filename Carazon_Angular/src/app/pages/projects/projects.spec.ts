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

	it('should create the component', () => {
		expect(component).toBeTruthy();
	});

	it('should render the hero title', () => {
		const title = fixture.debugElement.query(By.css('.projects-hero h1'));
		expect(title).toBeTruthy();
		expect(title.nativeElement.textContent).toContain('Our Projects');
	});

	it('should initialize filteredProjects with projects', () => {
		expect(component.filteredProjects.length).toBeGreaterThan(0);
		expect(component.filteredProjects.length).toBe(component.projects.length);
	});

	it('should filter projects by category', () => {
		component.filterByCategory('Sculpture');
		expect(component.selectedCategory).toBe('Sculpture');
		expect(component.filteredProjects.every(p => p.category === 'Sculpture')).toBeTrue();
	});

	it('should call viewProjectDetails when a project card is clicked', () => {
		spyOn(component, 'viewProjectDetails');

		const firstCard = fixture.debugElement.query(By.css('.project-card'));
		expect(firstCard).toBeTruthy();
		firstCard.triggerEventHandler('click', null);

		expect(component.viewProjectDetails).toHaveBeenCalled();
	});
});

