import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

import { User } from '../admin/modelos_de_datos/user'

@Injectable({
  providedIn: 'root'
})
export class AuthSessionService {

  api_url = 'http://localhost/msc_server/login'
  inicio_de_caja:boolean = false;
  
  constructor(private http:HttpClient,private router:Router){ }
 

  loginUser(form):any {
    return this.http.post<User>(this.api_url + '/login_user.php',form);
  }

  validacionUser(){
    let datosdeusuario = {
      key : localStorage.getItem('key'),
      username : localStorage.getItem('currentUser')
    }
    return this.http.post<User>(this.api_url + '/login_user_validation.php',datosdeusuario);
  }
  logOut(){
    localStorage.removeItem('currentUser');
    localStorage.removeItem('rol');
    localStorage.removeItem('key');
    console.log('sesion terminada');
    this.router.navigate(['/login']);
  }

  caja(estado):boolean{
    return this.inicio_de_caja = estado;
  }
}
