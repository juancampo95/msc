export class Ingreso{
    id?:number
    id_resumen?:number
    fecha:string
    detalle:string
    total:number
    usuario?:string
}
export class Gastos{
    id?:number
    id_resumen?:number
    fecha:string
    detalle:string
    tipo:string = "gasto"
    total:number
    usuario?:string
}