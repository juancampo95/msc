import { Component, OnInit, Input } from '@angular/core';
//modelo
import { Pedido } from '../../modelos_de_datos/pedidos';




@Component({
  selector: 'app-pedidosdiarios',
  templateUrl:'pedidosdiarios.component.html',
  styleUrls: ['pedidosdiarios.component.scss']
})
export class PedidosdiariosComponent implements OnInit {
  @Input() pedidos_realizados:Pedido[]
  constructor() { }

  ngOnInit() {
  }

}
