import { Component, OnInit, Input } from '@angular/core';
import { Producto } from '../../modelos_de_datos/producto';
import { Pedido } from '../../modelos_de_datos/pedidos';

import { MesasComponent } from '../mesas.component';

// servicios
import { DatabaseProductosService } from 'src/app/servicios/database-productos.service';


@Component({
  selector: 'app-detalle',
  templateUrl:'detalle.component.html',
  styleUrls: ['detalle.component.scss']
})
export class DetalleComponent implements OnInit {
  @Input() productos_agregados:Producto[];
  @Input() pedido_cargado:Pedido;
  @Input() meseros:string[];
  @Input() metodos_de_pago:string[];

  DatabaseProductosService: any;

  constructor(private mesas:MesasComponent, private http:DatabaseProductosService) {}
  
  ngOnInit() {

  } 
  recalcularTotal(product:Producto){
    this.mesas.recalcularTotal(product);
  }
  borrarProducto(product){
    this.mesas.borrarProducto(product);
  }
  calcularTotal(){
    this.mesas.calcularTotal();
  }

  enviarPedido(pedido,accion){
    console.log(accion);
    if(pedido.id == undefined || accion == 'post'){
      pedido.fecha = new Date().toLocaleDateString();
      pedido.hora = new Date().toLocaleTimeString();
      pedido.estado = 'Sin Facturar'
      this.http.enviarPedido(pedido).subscribe(res=>{
        console.log(res)
        this.mesas.cargarProductos()
        this.mesas.cargarPedidos();
      });
    }else if(pedido.id > 0  && accion == 'put'){
      pedido.productos = this.mesas.productos_agregados;
      console.log(pedido.productos)
      // pedido.productos = JSON.parse(pedido.productos)
      this.http.actualizarPedido(pedido).subscribe(res=>{
        console.log(res)
        this.mesas.cargarProductos()
        this.mesas.cargarPedidos();
      });
    }
  }
  eliminarPedido(pedido_cargado){
    this.http.eliminarPedido(pedido_cargado.id).subscribe(res=>{
      console.log(res);
      this.mesas.cargarProductos()
      this.mesas.cargarPedidos();
    })
  }
  sumarMesa(pedido){
    if(pedido.mesa >= 0){
      pedido.mesa ++
    }
  }
  restarMesa(pedido){
    if(pedido.mesa >= 1){
      pedido.mesa --;
    }
  }
  sumarProductos(product){
    this.mesas.sumarProductos(product);
  }
  restarProductos(product){
    this.mesas.restarProductos(product);
  }
  limpiarPedido(){
    this.mesas.productos_agregados = [];
    this.mesas.pedido_cargado.productos =  this.mesas.productos_agregados;
    this.mesas.pedido_cargado = new Pedido();
    this.mesas.cargarProductos();
    this.mesas.cargarPedidos();
  }
}
