import { Component, OnInit, Input } from '@angular/core';
import { ActivatedRoute} from '@angular/router';
import { Pedido } from '../../modelos_de_datos/pedidos';

import { MesasComponent } from '../mesas.component';
import { DatabaseProductosService } from 'src/app/servicios/database-productos.service';

@Component({
  selector: 'app-table',
  templateUrl:'table.component.html',
  styleUrls: [`table.component.scss`]
})
export class TableComponent implements OnInit {
  @Input() table:Pedido;
 

  constructor( 
    private mesas:MesasComponent,
  )
  { }

  ngOnInit() {
  }

  asignarPedidoParam(){
    this.mesas.asignarPedidoParam();
  }

  mostrarPedido(table){
    this.mesas.mostrarPedido(table);
  }
}
