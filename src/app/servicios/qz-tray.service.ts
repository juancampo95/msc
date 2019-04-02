import { Injectable } from '@angular/core';

import {Observable, from} from 'rxjs';
import {map, catchError} from 'rxjs/operators';
// import 'rxjs/add/observable/from';
// import 'rxjs/add/observable/throw';
// import 'rxjs/Rx'}
// import 'rxjs/add/operator/map';

declare var qz:any;

@Injectable({
  providedIn: 'root'
})
export class QzTrayService {

  constructor() { }

  getPrinters():Observable<string[]>{
    return from(
        qz.websocket.connect().then(()=> qz.printers.find())
        )
        .pipe(
          map((printers:any)=>printers),
          catchError((err,caught)=>{
           return this.errorHandler(err);
          })
        )
  }
  // printers:string[])=>printers).catch(this.errorHandler)
  errorHandler(errorHandler: any): any {
    throw new Error("Method not implemented." + errorHandler);
  }

  getPrinter(printerName:string):Observable<string>{
    return from(qz.websocket.connect()
      .then(()=>qz.printers.find(printerName))
    )
    .pipe(
      map((printer:string)=>printer),
      catchError((err,caught)=>{
        throw this.errorHandler(err);
      })
    )
  }
}
