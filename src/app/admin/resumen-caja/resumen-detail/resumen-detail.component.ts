import { Component, OnInit, Input } from '@angular/core';
import { ResumenCajaComponent } from '../resumen-caja.component';
import { DatabaseProductosService } from 'src/app/servicios/database-productos.service';
@Component({
  selector: 'app-resumen-detail',
  templateUrl:`resumen-detail.html`,
  styleUrls:['resumen-detail.scss']
})
export class ResumenDetailComponent implements OnInit {
  @Input() r_actual;
  online = 0;
  @Input() base_inicial;

  constructor(private resumen:ResumenCajaComponent,private Http:DatabaseProductosService) { }

  ngOnInit() {
  }

  calcularArqueo(){
    this.resumen.calcularArqueo();
    this.online = this.r_actual.datafono_a + this.r_actual.online_a;
  }

  postResumen(){
    this.Http.postResumenDiario(this.r_actual).subscribe(res=>{
    })
  }
}
