// modules
import { Component, OnInit } from '@angular/core';

// servicios
import { DatabaseProductosService } from 'src/app/servicios/database-productos.service';
// modelo de pedidos
import { Pedido } from '../modelos_de_datos/pedidos';

@Component({
  selector: 'app-pedidos',
  templateUrl:'pedidos.component.html',
  styleUrls: ['pedidos.component.css']
})
export class PedidosComponent implements OnInit {

  pedidos_realizados:Pedido[] = [];

  constructor(private http:DatabaseProductosService) { }

  ngOnInit() {
    this.cargarPedidosRealizados();
  }
  cargarPedidosRealizados(){
    this.http.getPedidos().subscribe(res=>{
      res.forEach(pedido=>{
        if(pedido.estado == 'Sin Facturar'){
          // console.log(pedido);
          this.pedidos_realizados.unshift(pedido);
          
        }
      })
      console.log(this.pedidos_realizados);
    })
    
  }
}
