import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ResumenDetailComponent } from './resumen-detail.component';

describe('ResumenDetailComponent', () => {
  let component: ResumenDetailComponent;
  let fixture: ComponentFixture<ResumenDetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ResumenDetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ResumenDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
