// modules
import { Component, OnInit } from '@angular/core';
// servicios
import { DatabaseProductosService } from 'src/app/servicios/database-productos.service';
// modelo de pedidos
import { Pedido } from '../modelos_de_datos/pedidos';
import { Router } from '@angular/router';
import { AuthSessionService } from 'src/app/servicios/auth-session.service';

@Component({
  selector: 'app-pedidos',
  templateUrl:'pedidos.component.html',
  styleUrls: ['pedidos.component.css']
})
export class PedidosComponent implements OnInit {

  pedidos_realizados:Pedido[] = [];
  pedidos_facturados:Pedido[] = [];

  constructor(private http:DatabaseProductosService,private Auth:AuthSessionService ,private router:Router) { }

  ngOnInit() {
    this.cargarPedidos();
  }
  cargarPedidos(){
    this.pedidos_facturados = [];
    this.pedidos_realizados = [];
    let user = localStorage.getItem('currentUser');
    var id_resumen = localStorage.getItem('id_resumen');
    this.http.getPedidos(user,id_resumen).subscribe(res=>{
          let caja = this.Auth.inicio_de_caja;
          if(caja == false){
            this.router.navigate(['administracion/resumen-de-caja']);
          }else if(res == null && caja == true){
            
            console.log(res);
          }else{
            res.forEach(pedido=>{
              if(pedido.estado == 'Sin Facturar'){
                this.pedidos_realizados.unshift(pedido);
              }else if(pedido.estado == 'facturado'){
                this.pedidos_facturados.unshift(pedido);
              }else if(pedido.estado == 'anulado'){
                this.pedidos_facturados.unshift(pedido);
              }else{
                console.log(pedido)
              }              
            })
          }
    })
  }
}
