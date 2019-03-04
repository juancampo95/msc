import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Producto } from '../admin/modelos_de_datos/producto';

@Injectable({
  providedIn: 'root'
})
export class DatabaseProductosService {

  api_url = 'http://localhost/msc_server'

  constructor(private Http:HttpClient) { }

  getProductos(){
    return this.Http.get<Producto[]>(this.api_url + '/get_productos.php')
  }
}
