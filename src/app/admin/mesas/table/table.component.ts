import { Component, OnInit, Input } from '@angular/core';

import { Pedido } from '../../modelos_de_datos/pedidos';

import { MesasComponent } from '../mesas.component';

@Component({
  selector: 'app-table',
  templateUrl:'table.component.html',
  styleUrls: [`table.component.css`]
})
export class TableComponent implements OnInit {
  @Input() table:Pedido;


  constructor(private mesas:MesasComponent) { }

  ngOnInit() {
  }

  mostrarPedido(table){
    Number(table.mesa);
    console.log(table.mesa)
    this.mesas.pedido_cargado = table;
    this.mesas.productos_agregados =JSON.parse(table.productos);

    table.productos.forEach(producto => {
      producto.anadido = '1';
    });
  }

}
