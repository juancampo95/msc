import { Component, OnInit } from '@angular/core';

// importando modelos
import { Producto } from '../modelos_de_datos/producto';
import { Pedido } from '../modelos_de_datos/pedidos';

// servicios
import { DatabaseProductosService } from 'src/app/servicios/database-productos.service';

@Component({
  selector: 'app-mesas',
  templateUrl: 'mesas.component.html',
  styleUrls: ['mesas.component.scss']
})
export class MesasComponent implements OnInit {
  listaFilter:any={nombre:''};
  listadeproductos:Producto[] = [];
  meseros:string[] = ['Caja','Carlos', 'Nicolas','Nelmar'];
  metodos_de_pago:string[] = ['Efectivo', 'Datafono'];
  mesasEnUso:Pedido[];
  productos_agregados:Producto[] = [];
  pedido_cargado:Pedido = new Pedido();
  
  constructor(private DatabaseProductosService:DatabaseProductosService){}

  ngOnInit() {this.cargarPedidos();this.cargarProductos();}

  cargarProductos(){
    this.DatabaseProductosService.getProductos().subscribe(productos=>{
      console.log("Productos Cargados");
     return this.listadeproductos = productos;
    });    
  }
  cargarPedidos(){
    this.mesasEnUso = []
    this.DatabaseProductosService.getPedidos().subscribe(pedidos=>{
      this.mesasEnUso = pedidos as Pedido[];
    })
  }

  // Añadir productos a la lista de pedido cargado
  anadirProducto(product:Producto){    
    let validacion = this.productos_agregados.includes(product);
    //hayando el valor total ->
    product.v_total = product.cantidad * product.v_unidad;

    if(validacion == true){
      alert("El producto ya está agregado, puede cambiar las cantidades si desea.");
    }else{
      product.anadido = '1';
      this.productos_agregados.push(product);
      this.pedido_cargado.productos =  this.productos_agregados;
      this.calcularTotal();
      

    }
  }
  // remover el producto desde modal
  borrarProducto(product){
    var i = this.productos_agregados.indexOf( product );
    if ( i !== -1 ) {
        this.productos_agregados.splice( i, 1 );
        product.anadido = '0';
        product.cantidad = 1;
        product.v_total = product.v_unidad * product.cantidad;
    }
    this.calcularTotal();
  }
  // Re-calcular el valor total del pedido cargado por cambios de los inputs number
  recalcularTotal(product:Producto){
    product.v_total = product.v_unidad * product.cantidad;
    this.calcularTotal();
  }
  // Calcular el valor total del pedido cargado

  calcularTotal(){
    this.pedido_cargado.subtotal_p = 0;
    this.pedido_cargado.total_p = 0;
    var sub = 0;
    this.productos_agregados.forEach(producto=>{
      sub += producto.v_total;
    })
    this.pedido_cargado.subtotal_p = sub;
    this.pedido_cargado.total_p = sub - this.pedido_cargado.descuento;
  }
  sumarProductos(product){
    if(product.cantidad >= 0){
      product.cantidad ++;
      this.recalcularTotal(product)
    }
  }
  restarProductos(product){
    if(product.cantidad >= 1){
      product.cantidad --;
      this.recalcularTotal(product)
    }
  }

  filtrar(producto){
    if(this.listaFilter.nombre == producto){
      this.listaFilter.nombre = "";
    }else{
      this.listaFilter.nombre = producto;
    }
  }
}
