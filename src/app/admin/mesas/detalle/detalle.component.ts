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
  validacionMesa:boolean;
  DatabaseProductosService: any;

  constructor(private mesas:MesasComponent, private http:DatabaseProductosService) {}
  
  ngOnInit() {
    this.pedido_cargado.mesa = 0;
    this.pedido_cargado.subtotal_p = 0;
    this.pedido_cargado.descuento = 0;
    this.pedido_cargado.total_p = 0;
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

  enviarPedido(pedido){
    pedido.fecha = new Date().toLocaleDateString();
    pedido.hora = new Date().toLocaleTimeString();
    pedido.estado = 'Sin Facturar'
    this.http.enviarPedido(pedido).subscribe(res=>{
      console.log(res)
      this.mesas.cargarProductos()
      this.mesas.cargarPedidos();
    });
  }
  sumarMesa(){
    this.validacionMesa = false;
    if(this.mesas.pedido_cargado.mesa >= 0){
      this.mesas.pedido_cargado.mesa ++
    }
  }
  restarMesa(){
    if(this.mesas.pedido_cargado.mesa >= 1){
      this.mesas.pedido_cargado.mesa --;
    }
    this.mesas.mesasEnUso.forEach(mesa=>{
    })
  }
  sumarProductos(product){
    this.mesas.sumarProductos(product);
  }
  restarProductos(product){
    this.mesas.restarProductos(product);
  }
  limpiarPedido(){
    let p = this.pedido_cargado;
    p.mesa = 0;
    p.subtotal_p = 0;
    p.descuento = 0;
    p.total_p = 0;
    p.mesero= undefined;
    p.cliente= undefined;
    p.metodo= undefined;
    p.documento= undefined;
    p.id = undefined;
    p.comentario = undefined;    
    p.fecha= undefined;
    p.estado = undefined;

    this.productos_agregados = [];
    this.pedido_cargado.productos =  this.productos_agregados;
    this.calcularTotal();
  }
}
