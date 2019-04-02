import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { FilterPipeModule } from 'ngx-filter-pipe';
import { HttpClientModule } from '@angular/common/http';

// Componentes
import { AdminComponent } from './admin/admin.component';
import { SideMenuComponent } from './admin/side-menu/side-menu.component';
import { TopbarComponent } from './admin/topbar/topbar.component';
import { LoginComponent } from './login/login.component';
import { MesasComponent } from './admin/mesas/mesas.component';
import { ConfiguracionesComponent } from './admin/configuraciones/configuraciones.component';
import { DetalleComponent } from './admin/mesas/detalle/detalle.component';
import { PedidosComponent } from './admin/pedidos/pedidos.component';
import { TableComponent } from './admin/mesas/table/table.component';
import { PedidosdiariosComponent } from './admin/pedidos/pedidosdiarios/pedidosdiarios.component';

// Servicios
import { DatabaseProductosService } from './servicios/database-productos.service';

const routes: Routes = [
  {path:"", redirectTo:"administracion",pathMatch:"full"},
  {path:"administracion",component:AdminComponent,
    children:[
      { path:"",redirectTo:"mesas",pathMatch:"full"},
      { path:"mesas",component:MesasComponent},
      { path:"pedidos",component:PedidosComponent},
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
    DetalleComponent,
    ConfiguracionesComponent,
    PedidosComponent,
    TableComponent,
    PedidosdiariosComponent
  ],
  imports: [
    RouterModule.forRoot(routes),
    CommonModule,
    FormsModule,
    FilterPipeModule,
    HttpClientModule
  ],
  providers:[
    DatabaseProductosService
  ],
  exports: [
    RouterModule,
  ]
})
export class AppRoutingModule { }
