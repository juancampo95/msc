import { Component, OnInit, Input } from '@angular/core';
//modelo
import { Pedido } from '../../modelos_de_datos/pedidos';
import { DatabaseProductosService } from 'src/app/servicios/database-productos.service';
import { PedidosComponent } from '../pedidos.component';


@Component({
  selector: 'app-pedidosdiarios',
  templateUrl:'pedidosdiarios.component.html',
  styleUrls: ['pedidosdiarios.component.scss']
})
export class PedidosdiariosComponent implements OnInit {
  a:number=1;
  @Input() pedidos_realizados:Pedido[]
  listaFilter:any={id:'',mesa:''};
  anulado = 'back_rojo';

  constructor(private parent:PedidosComponent, private http:DatabaseProductosService) { }

  ngOnInit() {
  }
  eliminarPedido(pedido_cargado){
    if(pedido_cargado.estado == 'facturado' || pedido_cargado.estado == 'Sin Facturar'){
      pedido_cargado.estado = 'anulado';
    }else{
      pedido_cargado.estado = 'Sin Facturar';
    }
    this.http.anularPedido(pedido_cargado).subscribe(res=>{
      console.log(res);
      this.parent.cargarPedidos()

    })
  }
}
