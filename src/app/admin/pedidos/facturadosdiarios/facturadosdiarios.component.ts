import { Component, OnInit, Input } from '@angular/core';
import { Pedido } from '../../modelos_de_datos/pedidos';
import { DatabaseProductosService } from 'src/app/servicios/database-productos.service';
import { PedidosComponent } from '../pedidos.component';

@Component({
  selector: 'app-facturadosdiarios',
  templateUrl: 'facturadosdiarios.component.html',
  styleUrls: ['facturadosdiarios.scss']
})
export class FacturadosdiariosComponent implements OnInit {
  p:number=1;
  @Input() pedidos_facturados:Pedido[];
  listaFilter:any={id:'',mesa:''};
  
  constructor(private parent:PedidosComponent, private http:DatabaseProductosService) { }

  ngOnInit() {
  }

  eliminarPedido(pedido_cargado){
    if(pedido_cargado.estado == 'facturado' || pedido_cargado.estado == 'Sin Facturar'){
      pedido_cargado.estado = 'anulado';
    }else{
      pedido_cargado.estado = 'facturado';
    }
    this.http.anularPedido(pedido_cargado).subscribe(res=>{
      console.log(res);
      this.parent.cargarPedidos()

    })
  }
}
