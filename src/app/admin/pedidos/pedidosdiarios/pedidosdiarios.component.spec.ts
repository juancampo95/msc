import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PedidosdiariosComponent } from './pedidosdiarios.component';

describe('PedidosdiariosComponent', () => {
  let component: PedidosdiariosComponent;
  let fixture: ComponentFixture<PedidosdiariosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PedidosdiariosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PedidosdiariosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
