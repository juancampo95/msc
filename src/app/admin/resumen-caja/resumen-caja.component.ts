import { Component, OnInit } from '@angular/core';
import { DatabaseProductosService } from 'src/app/servicios/database-productos.service';

import { Resumen } from '../modelos_de_datos/resumen_diario';
import { AuthSessionService } from 'src/app/servicios/auth-session.service';

@Component({
  selector: 'resumen-caja',
  templateUrl: `resumen-caja.html`,
  styleUrls: ['resumen-caja.scss']
})
export class ResumenCajaComponent implements OnInit {
  r_actual:Resumen = new Resumen();
  inicio:boolean = this.auth.inicio_de_caja;
  usuario = this.r_actual.usuario;
  base_inicial;


  constructor(private http:DatabaseProductosService, private auth:AuthSessionService) { }

  ngOnInit() {
    this.getResumen();
    this.sumarFacturados();
  }

  calcularSubTotales(){
    this.r_actual.total_ingresos = Number(this.r_actual.pedidos_facturados) + Number(this.base_inicial)  + Number(this.r_actual.datafono) + Number(this.r_actual.online) +  Number(this.r_actual.otros_ingresos);
    this.r_actual.total_gastos = Number(this.r_actual.vales) + Number(this.r_actual.compras_gastos);
    this.r_actual.total_resumen = this.r_actual.total_ingresos - this.r_actual.total_gastos;
    this.calcularArqueo()
  }
  sumarFacturados(){
    setTimeout(()=>{
      var id_resumen = localStorage.getItem('id_resumen');
      this.http.getPedidos(this.usuario,id_resumen).subscribe(res=>{
        if(res!=null){
        var n = Number(this.r_actual.pedidos_facturados);
        var d = Number(this.r_actual.datafono);
        var o = Number(this.r_actual.online);
        res.forEach(pedido=>{
          if(pedido.estado == 'facturado' && pedido.metodo == 'Efectivo'){
            n += Number(pedido.total_p);
            this.r_actual.pedidos_facturados = n;
            this.calcularSubTotales();
          }
          if(pedido.estado == 'facturado' && pedido.metodo == 'Datafono'){
            d += Number(pedido.total_p);
            this.r_actual.datafono = d;
            this.calcularSubTotales();
          }
          if(pedido.estado == 'facturado' && pedido.metodo == 'Online'){
            o += Number(pedido.total_p);
            this.r_actual.online = o;
            this.calcularSubTotales();
          }
        })
      }
      })
    },100)
}

  calcularArqueo(){
    this.r_actual.total_arqueo = Number(this.r_actual.billetes_a) + Number(this.r_actual.monedas_a);
    this.r_actual.descuadre = this.r_actual.total_resumen - this.r_actual.total_arqueo - this.r_actual.datafono_a - this.r_actual.online_a;
  }

  getResumen(){
    let user = localStorage.getItem('currentUser');
    this.http.getResumenDiario(user).subscribe(res=>{
      if(res == null){
        this.auth
        this.inicio = this.auth.caja(false);
      }else{
        this.inicio = this.auth.caja(true);
        this.r_actual = res;
        localStorage.setItem('id_resumen',this.r_actual.id.toString());
        this.base_inicial =  Number(this.r_actual.base_i_m) + Number(this.r_actual.base_i_b);
      }
      this.calcularArqueo()
      this.calcularSubTotales()
    })
  }

  iniciarResumen(){
    this.r_actual.fecha_ini = new Date().toLocaleDateString();
    this.r_actual.hora_ini = new Date().toLocaleTimeString();
    this.http.postResumenDiario(this.r_actual).subscribe(res=>{
      if(res=='ingreso correctamente'){
        this.auth.caja(true);
        this.inicio = true;
        this.getResumen();
      }else{
        console.log(res); 
      }
    })
  }
  
  cuadrarCaja(){
    if(this.r_actual.descuadre == 0){
      this.r_actual.fecha_fin = new Date().toLocaleDateString();
      this.r_actual.hora_fin = new Date().toLocaleTimeString();
      this.r_actual.total_arqueo = this.r_actual.total_resumen;
      this.r_actual.cuadrado = 'si';


      setTimeout(()=>{
        this.http.putResumen(this.r_actual,'cuadrar_resumen').subscribe(res=>{
          console.log("respuesta: "+res);
          if(res == "cuadre exitoso"){
            localStorage.removeItem('id_resumen');
            this.getResumen();
          }
       })
      },1000)
    }else{
      console.log("no esta cuadrado")
    }
  }
  guardarArqueo(){
    this.http.putResumen(this.r_actual,'guardarArqueo').subscribe(res=>{
      console.log(res);
      this.getResumen();
    })
  }

}
