import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-side-menu',
  templateUrl:'side-menu.component.html',
  styleUrls: ['side-menu.component.scss']
})
export class SideMenuComponent implements OnInit {
  username= 'Juan Camilo';
  links = [
    { 
      nombre:"Mesas",
      enlace:"mesas",
      icono:"aspect_ratio"
    },
    { 
      nombre:"Pedidos",
      enlace:"pedidos",
      icono:"assignment"
    },
    { 
      nombre:"Configuraciones",
      enlace:"configuraciones",
      icono:"settings"
    }
  ]
  
  constructor() { }

  ngOnInit() {
  }

}
