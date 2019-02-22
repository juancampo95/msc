import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';

// Componentes
import { AdminComponent } from './admin/admin.component';
import { SideMenuComponent } from './admin/side-menu/side-menu.component';
import { TopbarComponent } from './admin/topbar/topbar.component';
import { LoginComponent } from './login/login.component';
import { MesasComponent } from './admin/mesas/mesas.component';
import { ConfiguracionesComponent } from './admin/configuraciones/configuraciones.component';

const routes: Routes = [
  {path:"", redirectTo:"administracion",pathMatch:"full"},
  {path:"administracion",component:AdminComponent,
    children:[
      { path:"",redirectTo:"mesas",pathMatch:"full"},
      { path:"mesas",component:MesasComponent},
      { path:"configuraciones",component:ConfiguracionesComponent}
    ]
  },
  {path:"login",component:LoginComponent}
];

@NgModule({
  declarations:[
    AdminComponent,
    LoginComponent,
    SideMenuComponent,
    TopbarComponent,
    MesasComponent,
    ConfiguracionesComponent
  ],
  imports: [
    RouterModule.forRoot(routes),
    CommonModule,
  ],
  exports: [
    RouterModule,
  ]
})
export class AppRoutingModule { }
