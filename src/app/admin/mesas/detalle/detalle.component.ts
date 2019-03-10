import { Component, OnInit, Input } from '@angular/core';
import { Producto } from '../../modelos_de_datos/producto';
import { Pedido } from '../../modelos_de_datos/pedidos';

import { MesasComponent } from '../mesas.component';

@Component({
  selector: 'app-detalle',
  templateUrl:'detalle.component.html',
  styleUrls: ['detalle.component.scss']
})
export class DetalleComponent implements OnInit {
  @Input() productos_agregados:object[];
  @Input() pedido_cargado:Pedido;
  @Input() meseros:string[];
  @Input() metodos_de_pago:string[];

  constructor(private mesas:MesasComponent) {}

  ngOnInit() {
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
}
