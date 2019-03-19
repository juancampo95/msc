import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Producto } from '../admin/modelos_de_datos/producto';
import { Pedido} from '../admin/modelos_de_datos/pedidos';

@Injectable({
  providedIn: 'root'
})
export class DatabaseProductosService {

  api_url = 'http://localhost/msc_server'

  constructor(private Http:HttpClient) { }

  getProductos(){
    return this.Http.get<Producto[]>(this.api_url + '/get_productos.php')
  }

  getPedidos(){
    return this.Http.get<Pedido[]>(this.api_url + '/get_pedidos.php')
  }

  enviarPedido(pedido){
    return this.Http.post(this.api_url + '/post_pedidos.php',pedido,{responseType:'text'});
  }

  actualizarPedido(pedido){
    return this.Http.post(this.api_url + '/put_pedidos.php',pedido,{responseType:'text'});
  }

  eliminarPedido(id_pedido){
    return this.Http.post(this.api_url + '/delete_pedidos.php',id_pedido,{responseType:'text'});
  }
}
