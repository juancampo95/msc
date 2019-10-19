import {Producto} from './producto';

export class Pedido{
    id?:number;
    id_resumen?:string = localStorage.getItem('id_resumen');
    fecha?:string;
    hora?:string;
    cliente?:string;
    documento?:string;
    mesero?:string = "Caja";
    metodo?:string = "Efectivo";
    productos?:Producto[] = [];
    subtotal_p?:number = 0;
    total_p?:any = 0;
    descuento?:number = 0;
    comentario?:string = "";
    mesa?:any = 0;
    pagadocon?:number = 0;
    devuelve?:number=0;
    estado?:string = "";
    usuario?:string = localStorage.getItem('currentUser');
 }