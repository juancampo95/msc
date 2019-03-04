import { Component, OnInit, Input } from '@angular/core';
import { Producto } from '../../modelos_de_datos/producto';

@Component({
  selector: 'app-detalle',
  templateUrl:'detalle.component.html',
  styleUrls: ['detalle.component.scss']
})
export class DetalleComponent implements OnInit {
  @Input() productos_agregados:object[];
  @Input() meseros:string[];
  @Input() metodos_de_pago:string[];

  subtotal:number = 0;
  descuento:number = 0;
  total:number = 0;

  constructor() { }

  ngOnInit() {
  } 
  recalcularTotal(product:Producto){
    product.v_total = product.v_unidad * product.cantidad;
  }
  borrarProducto(product){
    console.log("al menos funciona el boton");
    var i = this.productos_agregados.indexOf( product );
    if ( i !== -1 ) {
        this.productos_agregados.splice( i, 1 );
        product.anadido = false;
        product.cantidad = 1;
    }
  }
}
