import {Producto} from './producto';

export interface Pedido{
    id?:number,
    fecha?:string,
    hora?:string,
    cliente?:string,
    documento?:string
    mesero?:string,
    metodo?:string,
    productos?:Producto[],
    subtotal_p?:number,
    total_p?:number,
    descuento?:number,
    comentario?:string,
    mesa?:any,
    estado?:string
}