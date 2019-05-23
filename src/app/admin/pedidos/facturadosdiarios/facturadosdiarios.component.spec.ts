import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FacturadosdiariosComponent } from './facturadosdiarios.component';

describe('FacturadosdiariosComponent', () => {
  let component: FacturadosdiariosComponent;
  let fixture: ComponentFixture<FacturadosdiariosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FacturadosdiariosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FacturadosdiariosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
