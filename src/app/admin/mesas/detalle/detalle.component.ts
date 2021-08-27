import { Component, OnInit, Input } from '@angular/core';
import { Producto } from '../../modelos_de_datos/producto';
import { Pedido } from '../../modelos_de_datos/pedidos';
import { MesasComponent } from '../mesas.component';
import { Router } from '@angular/router';

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
  @Input() pedidovacio:boolean = false;
  percentDescuento:number = 0;
  DatabaseProductosService: any;
  notas:string[]=['llevar','todas','verde','piña','empacar salsas',]

  constructor(private mesas:MesasComponent, private http:DatabaseProductosService,private Router:Router) {}
  
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
    // pedido.id_resumen = localStorage.getItem('id_resumen')
    if(pedido.id == undefined && accion == 'post'){
      pedido.fecha = new Date().toLocaleDateString();
      pedido.hora = new Date().toLocaleTimeString();
      // pedido.id_resumen = 
      pedido.estado = 'Sin Facturar'
      if(pedido.documento == undefined){
        pedido.documento = "0"
      }
      if(pedido.cliente == undefined){
        pedido.cliente = "0"
      }
    
      this.http.enviarPedido(pedido).subscribe(res=>{
        pedido.id= parseInt(res[0].id)
        // this.imprimirPedido("",pedido);
        this.mesas.cargarProductos()
        this.mesas.cargarPedidos();
        // console.log(res);
      });
      
    }else if(pedido.id > 0  && accion == 'put'){
      pedido.productos = this.mesas.productos_agregados;
      this.http.actualizarPedido(pedido).subscribe(res=>{
        this.mesas.cargarProductos();
        this.mesas.cargarPedidos();
      });
      
    }else if((pedido.id == undefined || pedido.id > 0) && accion == 'facturar'){
      pedido.productos = this.mesas.productos_agregados;
      pedido.fecha = new Date().toLocaleDateString();
      pedido.hora = new Date().toLocaleTimeString();
      pedido.estado = 'facturado'
      this.http.facturarPedido(pedido).subscribe(res=>{
        this.mesas.cargarProductos()
        this.mesas.cargarPedidos();
      });
    }
    else if((pedido.id == undefined || pedido.id > 0) && accion == 'imprimir factura'){
      pedido.productos = this.mesas.productos_agregados;
      pedido.estado = 'facturado'
      this.http.imprimirFacturaSola(pedido).subscribe(res=>{
        this.mesas.cargarProductos()
        this.mesas.cargarPedidos();
      });
    }
  }
  imprimirPedido(btn?,pedido?){
    if(btn == "btn"){
      pedido = this.pedido_cargado;
      pedido.productos = this.mesas.productos_agregados;
      this.http.actualizarPedido(pedido).subscribe(res=>{console.log(res)});
    }
    this.http.imprimirPedido(pedido).subscribe(res=>{
      console.log(res);
      this.mesas.cargarProductos()
      this.mesas.cargarPedidos();
      console.log("paso por el ts")
    })
  }
  eliminarPedido(pedido_cargado){
    if(pedido_cargado.estado == 'facturado' || pedido_cargado.estado == 'Sin Facturar'){
      pedido_cargado.estado = 'anulado';
    }else{
      pedido_cargado.estado = 'facturado';
    }
    this.http.anularPedido(pedido_cargado).subscribe(res=>{
      console.log(res);
      this.limpiarPedido();

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
    this.Router.navigate(['/administracion/mesas']);
    this.mesas.productos_agregados = [];
    this.mesas.pedido_cargado.productos =  this.mesas.productos_agregados;
    this.mesas.pedido_cargado = new Pedido();
    this.mesas.cargarProductos();
    this.mesas.cargarPedidos();
    this.mesas.pedidovacio = false;
  }
  decuentode(valor){
    this.pedido_cargado.descuento = valor;
    this.calcularTotal();
  }
  porcentar(){
    this.mesas.pedido_cargado.descuento = this.pedido_cargado.subtotal_p  * this.percentDescuento /100; 
    this.calcularTotal();
  }
  comentar(nota){
    this.mesas.pedido_cargado.comentario += nota+", ";
  }
}
