import { Component, OnInit } from '@angular/core';

import { AuthSessionService } from 'src/app/servicios/auth-session.service';
@Component({
  selector: 'app-topbar',
  templateUrl:'topbar.component.html',
  styleUrls: ['topbar.component.scss']
})
export class TopbarComponent implements OnInit {
  fecha = new Date().toLocaleString()
  
  constructor(private AuthS:AuthSessionService) { }

  ngOnInit() {
    this.currentTime();
  }
  logOut(){
    this.AuthS.logOut();
  }
  currentTime(){
    setInterval(()=>{
      this.fecha = new Date().toLocaleString()
    },1000)
  }
}
