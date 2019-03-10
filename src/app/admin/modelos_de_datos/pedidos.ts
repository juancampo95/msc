import {Producto} from './producto';

export interface Pedido{
    id?:number,
    fecha?:string,
    cliente?:string,
    mesero?:string,
    productos?:Producto[],
    subtotal_p?:number,
    total_p?:number,
    descuento?:number,
    comentario?:string,
    mesa?:string,
}