import { TestBed } from '@angular/core/testing';

import { DatabaseProductosService } from './database-productos.service';

describe('DatabaseProductosService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: DatabaseProductosService = TestBed.get(DatabaseProductosService);
    expect(service).toBeTruthy();
  });
});
