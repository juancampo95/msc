import { Component, OnInit } from '@angular/core';
import { AuthSessionService } from '../servicios/auth-session.service';

@Component({
  selector: 'app-admin',
  templateUrl:"admin.component.html",
  styles: []
})
export class AdminComponent implements OnInit {

  constructor(private AuthS:AuthSessionService ) {
    this.AuthS.validacionUser().subscribe(res=>{
      if(res.status !== 'autenticado'){
        this.AuthS.logOut();
      }   
    })
  }

  ngOnInit() {

  }

}
