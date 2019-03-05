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
  
  productos_agregados:Producto[] = [];
  pedido_cargado:Pedido={};
  
  constructor(private DatabaseProductosService:DatabaseProductosService){

   }

  ngOnInit() {
    return this.DatabaseProductosService.getProductos().subscribe(productos=>{
      console.log(productos);
      this.listadeproductos = productos;
    });
  }

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
      console.log(this.pedido_cargado);
    }
  }
  // remover el producto desde modal
  borrarProducto(product){
    console.log("al menos funciona el boton");
    var i = this.productos_agregados.indexOf( product );
    if ( i !== -1 ) {
        this.productos_agregados.splice( i, 1 );
        product.anadido = '0';
        product.cantidad = 1;
    }
  }

  recalcularTotal(product:Producto){
    product.v_total = product.v_unidad * product.cantidad;
    this.calcularTotal();
  }
  calcularTotal(){
    this.productos_agregados.forEach(producto=>{
      this.pedido_cargado.subtotal_p += producto.v_total;
      console.log(this.productos_agregados);
      console.log(this.pedido_cargado.subtotal_p);
    })
  }
}
