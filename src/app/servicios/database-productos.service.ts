import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Producto } from '../admin/modelos_de_datos/producto';
import { Pedido} from '../admin/modelos_de_datos/pedidos';
import { Resumen } from '../admin/modelos_de_datos/resumen_diario';

@Injectable({
  providedIn: 'root'
})
export class DatabaseProductosService {

  api_url = 'http://localhost/msc_server'

  constructor(private Http:HttpClient) { }
  getProductos(){
    return this.Http.get<Producto[]>(this.api_url + '/get_productos.php')
  }
  getPedidos(paramUser){
    return this.Http.get<Pedido[]>(this.api_url + '/get_pedidos.php?user='+paramUser);
  }
  enviarPedido(pedido){
    return this.Http.post(this.api_url + '/post_pedidos.php',pedido);
  }
  actualizarPedido(pedido){
    return this.Http.post(this.api_url + '/put_pedidos.php',pedido,{responseType:'text'});
  }
  facturarPedido(pedido){
    return this.Http.post(this.api_url + '/facturar_pedidos.php',pedido,{responseType:'text'});
  }
  imprimirPedido(pedido){
    return this.Http.post(this.api_url + '/imprimir_pedido.php',pedido,{responseType:'text'});
  }
  anularPedido(idyestado){
    return this.Http.post(this.api_url + '/anulacion_pedidos.php',idyestado,{responseType:'text'});
  }
  imprimirFacturaSola(pedido){
    return this.Http.post(this.api_url + '/imprimir_factura_sola.php',pedido,{responseType:'text'});
  }
  getResumenDiario(paramUser){
    return this.Http.get<Resumen>(this.api_url + '/get_resumen_diario.php?user='+paramUser);
  }
  postResumenDiario(Resumen:Resumen){
    return this.Http.post(this.api_url + '/post_resumen_diario.php',Resumen,{responseType:'text'});
  }
  putResumen(Resumen,param){
    return this.Http.post(this.api_url +'/put_resumen_diario.php?funcion='+param,Resumen,{responseType:'text'});
  }
  getIngresos(Resumen){
    return this.Http.post(this.api_url +'/get_ingresos.php',Resumen);
  }
  getGastos(Resumen){
    return this.Http.post(this.api_url +'/get_gastos.php',Resumen);
  }

}
