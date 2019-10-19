import { Pedido } from './pedidos';
import { Ingreso, Gastos } from './ingresos';

export class Resumen{
    id?:number;
    fecha_ini?:string;
    hora_ini?:string;
    fecha_fin?:string = "sin fecha final";
    hora_fin?:string = "sin hora final";
    usuario?:string = localStorage.getItem('currentUser');

    base_i_b?:number = 0;
    base_i_m?:number = 0;
    pedidos_facturados?:number;
    datafono?:number =0;
    online?:number= 0;
    otros_ingresos?:number = 0;
    total_ingresos?:number = 0;

    compras_gastos?:number = 0;
    vales?:number = 0;
    total_gastos?: number = 0;
    total_resumen?: number = 0;
    billetes_a?: number = 0;
    monedas_a?:number = 0;
    datafono_a?:number = 0;
    online_a?:number = 0;
    total_arqueo?:number = 0;
    descuadre?:number ;

    cuadrado?:string = 'no';

 }