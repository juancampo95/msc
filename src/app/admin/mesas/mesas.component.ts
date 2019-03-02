import { Component, OnInit } from '@angular/core';

// importando modelos
import { Producto } from '../modelos_de_datos/producto';

@Component({
  selector: 'app-mesas',
  templateUrl: 'mesas.component.html',
  styleUrls: ['mesas.component.scss']
})
export class MesasComponent implements OnInit {
  anadido:boolean = false;
  listaFilter:any={nombre:''}
  listadeproductos:Producto[] = [
    {
      nombre:"Salchipapa Especial",
      v_unidad:2000,
      v_total:2000,
      cantidad:1,
      foto:'maisitos.jpg',
      descripcion:`2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.`,
      tipo:'comida',
      anadido:false
      
    },
    {
      nombre:"Maicitos",
      v_unidad:2000,
      v_total:2000,
      cantidad:1,
      foto:'maisitos.jpg',
      descripcion:`2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.`,
      tipo:'comida',
      anadido:false
      
    },
    {
      nombre:"Hamburguesa",
      v_unidad:2000,
      v_total:2000,
      cantidad:1,
      foto:'hamburguesadepollo+.png',
      descripcion:`2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.`,
      tipo:'comida',
      anadido:false
      
    },
    {
      nombre:"Salchipapa Especial",
      v_unidad:2000,
      v_total:2000,
      cantidad:1,
      foto:'maisitos.jpg',
      descripcion:`2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.`,
      tipo:'comida',
      anadido:false
      
    },
    {
      nombre:"Maicitos",
      v_unidad:2000,
      v_total:2000,
      cantidad:1,
      foto:'maisitos.jpg',
      descripcion:`2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.`,
      tipo:'comida',
      anadido:false
      
    },
    {
      nombre:"Hamburguesa",
      v_unidad:2000,
      v_total:2000,
      cantidad:1,
      foto:'hamburguesadepollo+.png',
      descripcion:`2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.`,
      tipo:'comida',
      anadido:false
      
    },
    {
      nombre:"Perro Caliente",
      v_unidad:3000,
      v_total:3000,
      cantidad:1,
      foto:'perro.png',
      descripcion:`2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.`,
      tipo:'comida',
      anadido:false
    },
    {
      nombre:"Pepsi Cola",
      v_unidad:3000,
      v_total:3000,
      cantidad:1,
      foto:'gaseosas.png',
      descripcion:`2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.`,
      tipo:'bebida',
      anadido:false
    },
    {
      nombre:"Mango (Jugo nataral cona Agua)",
      v_unidad:3000,
      v_total:3000,
      cantidad:1, 
      foto:'jugos.png',
      descripcion:`2 ingredientes especiales, queso, ripio papa amarilla, salchicha y salsas caseras.`,
      tipo:'bebida',
      anadido:false
    },
  ]

  productos_agregados:Producto[] = [];
  constructor() { }

  ngOnInit() {
  }

  anadirProducto(product:Producto){    
    //hayando el valor total ->
    let validacion = this.productos_agregados.includes(product);

    product.v_total = product.cantidad * product.v_unidad;

    if(validacion == true){
      alert("El producto ya está agregado, puede cambiar las cantidades si desea.");
      product.anadido=false;
    }else{
      this.productos_agregados.push(product);
      product.anadido=true;
    }
  }
  recalcularTotal(product:Producto){
    product.v_total = product.v_unidad * product.cantidad;
  }
  // remover el producto desde modal
  borrarProducto(product){
    console.log("al menos funciona el boton");
    var i = this.productos_agregados.indexOf( product );
    if ( i !== -1 ) {
        this.productos_agregados.splice( i, 1 );
        product.anadido = false;
        product.cantidad = 1;
    }
  }
}
