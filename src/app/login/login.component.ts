import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthSessionService } from '../servicios/auth-session.service';

@Component({
  selector: 'app-login',
  templateUrl: `login.component.html`,
  styleUrls: ['login.component.scss']
})
export class LoginComponent implements OnInit {
  error_class ="error_text_off"
  success_class ="error_text_off"

  constructor(private  AuthS: AuthSessionService,private router:Router) {
    this.AuthS.validacionUser().subscribe(res=>{
      if(res.status == 'autenticado'){
        this.router.navigate(['administracion']);
      }   
    })
  }

  ngOnInit() {
    
  }
  loginUser(form){
    this.AuthS.loginUser(form).subscribe(res=>{
      console.log(res);
      if(res.status == '1'){
        this.success_class ="success_text"
        this.error_class ="error_text_off"
        this.router.navigate(['/administracion']);
        localStorage.setItem('currentUser',res.username);
        localStorage.setItem('rol',res.rol);
        localStorage.setItem('key',res.key);

      }else{
        this.success_class ="error_text_off"
        this.error_class ="error_text_active"
        this.AuthS.logOut();
      }
    })
    
  }
}
