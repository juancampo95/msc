import { Component, OnInit, Input } from '@angular/core';

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


  constructor(private DatabaseProductosService:DatabaseProductosService, private mesas:MesasComponent) { }

  ngOnInit() {
  }

  mostrarPedido(table){
    this.DatabaseProductosService.getProductos().subscribe(productos=>{
      this.mesas.listadeproductos = productos;
      this.mesas.pedidovacio = true;
      Number(table.mesa);

      this.mesas.pedido_cargado = table;
      let tipo = typeof(table.productos);
      if(tipo === "string"){
        this.mesas.productos_agregados = JSON.parse(table.productos);
      }else{
        this.mesas.productos_agregados = table.productos;
      }

      this.mesas.productos_agregados.forEach(producto=>{
        for(var i = 0; this.mesas.listadeproductos.length > i; i++){
          if(this.mesas.listadeproductos[i].id == producto.id){
              this.mesas.listadeproductos[i] = producto;
          }
        }
      });
    });    
  }
}
