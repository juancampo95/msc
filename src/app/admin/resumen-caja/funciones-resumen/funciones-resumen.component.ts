import { Component, OnInit, Input } from '@angular/core';
import { Resumen } from '../../modelos_de_datos/resumen_diario';
import { Ingreso, Gastos} from '../../modelos_de_datos/ingresos';

import { DatabaseProductosService } from 'src/app/servicios/database-productos.service';
import { ResumenCajaComponent } from '../resumen-caja.component';


@Component({
  selector: 'app-funciones-resumen',
  templateUrl: `funciones-resumen.html`,
  styleUrls: ['funciones-resumen.scss']
})
export class FuncionesResumenComponent implements OnInit {
  pestana:string = "base inicial";
  base_i_b = 0;
  base_i_m = 0;
  total_base_inicial = 0;
  nuevoIngreso = new Ingreso();
  btn_ingreso = "Agregar";
  o_ingresos:any = 0;
  o_gastos:any = 0;
  nuevoGasto = new Gastos();
  btn_gastos = "Agregar";

  @Input() r_actual:Resumen;

  constructor(private resumen:ResumenCajaComponent, private Http:DatabaseProductosService) { }

  ngOnInit() {
    this.cargarResumenDiario();    
  }
  
  cambioPestana(which){
    this.pestana = which;
  }
  
  cargarResumenDiario(){
    let user = localStorage.getItem('currentUser');
    this.Http.getResumenDiario(user).subscribe(res=>{
      if(res == null){
      }else{
        this.base_i_m = res.base_i_m;
        this.base_i_b = res.base_i_b;
      }
      this.cargarIngresos();
      this.mostrarGastos();
      this.calcularBaseInicial();
      this.resumen.calcularSubTotales();

    })
  }
  calcularBaseInicial(){
    this.total_base_inicial = Number(this.base_i_b) +  Number(this.base_i_m);
    this.resumen.base_inicial = this.total_base_inicial;
    this.resumen.calcularSubTotales();
  }
  enviarBaseInicial(param){
    this.r_actual.base_i_b = this.base_i_b;
    this.r_actual.base_i_m = this.base_i_m;
    this.Http.putResumen(this.r_actual,param).subscribe(res=>{
// que hacer después de actualizar base
    })
  }
  agregarIngreso(param){
    this.nuevoIngreso.fecha = new Date().toLocaleDateString();
    this.nuevoIngreso.id_resumen = this.r_actual.id;
    this.nuevoIngreso.usuario = this.r_actual.usuario;
    this.Http.putResumen(this.nuevoIngreso,param).subscribe(res=>{
      this.cargarIngresos()
      console.log(res);
      this.nuevoIngreso = new Ingreso;
    })
  }
  cargarIngresos(){
    setTimeout(()=>{
      this.r_actual.otros_ingresos = 0;
      this.Http.getIngresos(this.r_actual).subscribe(res=>{

        if(res != null){
          this.o_ingresos = res;
          this.o_ingresos.forEach(element => {
            this.r_actual.otros_ingresos += parseInt(element.total);        
            this.resumen.calcularSubTotales();
          });
        }
      })
    },100) 
  }
  cargarIngreso(i){
    this.btn_ingreso = "Actualizar";
    this.nuevoIngreso = i;
  }
  eliminarIngreso(id,param){
    this.Http.putResumen(id,param).subscribe(res=>{
      this.cargarIngresos();
      console.log(res);
    })
  }
  limpiar(param){
    if(param == 'gasto'){
      this.btn_gastos = "Agregar"
      this.nuevoGasto = new Gastos()      
    }else if(param =='ingreso'){
      this.btn_ingreso = "Agregar"
      this.nuevoIngreso = new Ingreso()
    }
  }
  // metodos para gastos
  agregarGasto(param){
    this.nuevoGasto.fecha = new Date().toLocaleDateString();
    this.nuevoGasto.id_resumen = this.r_actual.id;
    this.nuevoGasto.usuario = this.r_actual.usuario;
    this.Http.putResumen(this.nuevoGasto,param).subscribe(res=>{
      this.mostrarGastos()
      console.log(res);
      this.nuevoGasto = new Gastos;
    })
  }
  mostrarGastos(){
    setTimeout(()=>{
      this.r_actual.compras_gastos = 0;
      this.r_actual.vales = 0;
      this.Http.getGastos(this.r_actual).subscribe(res=>{

        if(res != null){
          this.o_gastos = res;
          console.log(this.o_gastos);
          this.o_gastos.forEach(element => {
            if(element.tipo == 'gasto'){
              this.r_actual.compras_gastos += parseInt(element.total);        
            }else if(element.tipo == 'vale'){
              this.r_actual.vales += parseInt(element.total);        
            }
            this.resumen.calcularSubTotales();
          });
        }
      })
    },100) 
  }
  cargarGasto(i){
    this.btn_gastos = "Actualizar";
    this.nuevoGasto = i;
  }
  eliminarGasto(id,param){
    this.Http.putResumen(id,param).subscribe(res=>{
      this.mostrarGastos();
      console.log(res);
    })
  }
}
