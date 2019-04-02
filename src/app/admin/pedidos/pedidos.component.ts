import { Component, OnInit } from '@angular/core';
import { QzTrayService } from 'src/app/servicios/qz-tray.service';


@Component({
  selector: 'app-pedidos',
  templateUrl:'pedidos.component.html',
  styleUrls: ['pedidos.component.css']
})
export class PedidosComponent implements OnInit {

  constructor(private Qz:QzTrayService) { }

  ngOnInit() {
    this.Qz.getPrinters();
  }

}
