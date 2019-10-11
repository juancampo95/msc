import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';


// importando modelos
import { Producto } from '../modelos_de_datos/producto';
import { Pedido } from '../modelos_de_datos/pedidos';

// servicios
import { DatabaseProductosService } from 'src/app/servicios/database-productos.service';
import { AuthSessionService } from 'src/app/servicios/auth-session.service';


@Component({
  selector: 'app-mesas',
  templateUrl: 'mesas.component.html',
  styleUrls: ['mesas.component.scss']
})
export class MesasComponent implements OnInit {
  listaFilter:any={nombre:''};
  listadeproductos:Producto[] = [];
  meseros:string[] = ['Caja','Nicolas','Nelmar'];
  metodos_de_pago:string[] = ['Efectivo', 'Datafono','Online'];
  mesasEnUso:Pedido[]=[];
  productos_agregados:Producto[] = [];
  pedido_cargado:Pedido = new Pedido();
  pedidovacio:boolean;
  idParam:number;
  user = localStorage.getItem('currentUser');
  constructor(
    private DatabaseProductosService:DatabaseProductosService, private Route:ActivatedRoute, private router:Router, private Auth:AuthSessionService)
  {}

  ngOnInit() {
    this.cargarPedidos();
    this.cargarProductos();
    this.idParam = parseInt(this.Route.snapshot.paramMap.get('id'));
    if(isNaN(this.idParam) == false){
      // console.log('busca el pedido del parametro');
      this.asignarPedidoParam();
    }
  }
  cargarProductos(){
    this.DatabaseProductosService.getProductos().subscribe(productos=>{
     return this.listadeproductos = productos;
    // console.log(productos);
    });    
  }
  cargarPedidos(){
    this.mesasEnUso = []
    this.DatabaseProductosService.getPedidos(this.user).subscribe(pedidos=>{
      let caja = this.Auth.inicio_de_caja;
      if(pedidos == null && caja == false ){
        this.router.navigate(['administracion/resumen-de-caja']);
      }else if(pedidos == null && caja == true){
        // console.log("puedes hacer pedidos");
      }else{
        pedidos.forEach(pedido=>{
          if(pedido.estado == 'Sin Facturar'){
            if(pedido.mesa > 0){
              this.mesasEnUso.push(pedido);
            }
          }
        })
      }
    })
  }
  // Añadir productos a la lista de pedido cargado
  anadirProducto(product:Producto){    
    let validacion = this.productos_agregados.includes(product);
    //hayando el valor total ->
    product.v_total = product.cantidad * product.v_unidad;
    this.pedidovacio=true;
    if(validacion == true){
      alert("El producto ya está agregado, puede cambiar las cantidades si desea.");
    }else{
      product.anadido = '1';
      this.productos_agregados.push(product);
      this.pedido_cargado.productos =  this.productos_agregados;
      this.calcularTotal();
    }
  }
  // remover el producto desde modal
  borrarProducto(product){
    var i = this.productos_agregados.indexOf( product );
    if ( i !== -1 ) {
        this.productos_agregados.splice( i, 1 );
        product.anadido = '0';
        product.cantidad = 1;
        product.v_total = product.v_unidad * product.cantidad;
    }
    this.calcularTotal();
  }
  // Re-calcular el valor total del pedido cargado por cambios de los inputs number
  recalcularTotal(product:Producto){
    product.v_total = product.v_unidad * product.cantidad;
    this.calcularTotal();
  }
  // Calcular el valor total del pedido cargado

  calcularTotal(){
    this.pedido_cargado.subtotal_p = 0;
    this.pedido_cargado.total_p = 0;
    var sub = 0;
    
    this.productos_agregados.forEach(producto=>{
      sub += producto.v_total;
    })
    this.pedido_cargado.subtotal_p = sub;
    this.pedido_cargado.total_p = sub - this.pedido_cargado.descuento;
    this.pedido_cargado.devuelve = this.pedido_cargado.pagadocon - this.pedido_cargado.total_p;
    console.log("devuelve: " + this.pedido_cargado.devuelve + "y paga con: " + this.pedido_cargado.pagadocon);
  }
  sumarProductos(product){
    if(product.cantidad >= 0){
      product.cantidad ++;
      this.recalcularTotal(product)
    }
  }
  restarProductos(product){
    if(product.cantidad >= 1){
      product.cantidad --;
      this.recalcularTotal(product)
    }
  }
  filtrar(producto){
    if(this.listaFilter.nombre == producto){
      this.listaFilter.nombre = "";
    }else{
      this.listaFilter.nombre = producto;
    }
  }


  // metodo para activar carga de mesas en el detalle
  mostrarPedido(table){
    this.DatabaseProductosService.getProductos().subscribe(productos=>{
      
      this.listadeproductos = productos;
      this.pedidovacio = true;
      Number(table.mesa);

      this.pedido_cargado = table;
      let tipo = typeof(table.productos);
      if(tipo === "string"){
        this.productos_agregados = JSON.parse(table.productos);
      }else{
        this.productos_agregados = table.productos;
      }

      this.productos_agregados.forEach(producto=>{
        for(var i = 0; this.listadeproductos.length > i; i++){
          if(this.listadeproductos[i].id == producto.id){
              this.listadeproductos[i] = producto;
          }
        }
      });
    });    
  }

  asignarPedidoParam(){
    this.DatabaseProductosService.getPedidos(this.user).subscribe(pedidos=>{
      pedidos.forEach(pedido=>{
        if(pedido.id == this.idParam){
          this.mostrarPedido(pedido);
        }
      })
    })
  }
}
