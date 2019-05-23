import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FuncionesResumenComponent } from './funciones-resumen.component';

describe('FuncionesResumenComponent', () => {
  let component: FuncionesResumenComponent;
  let fixture: ComponentFixture<FuncionesResumenComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FuncionesResumenComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FuncionesResumenComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
