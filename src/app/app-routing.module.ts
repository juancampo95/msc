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
import { FacturadosdiariosComponent } from './admin/pedidos/facturadosdiarios/facturadosdiarios.component';
import { ResumenCajaComponent } from './admin/resumen-caja/resumen-caja.component';
import { ResumenDetailComponent } from './admin/resumen-caja/resumen-detail/resumen-detail.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { FuncionesResumenComponent } from './admin/resumen-caja/funciones-resumen/funciones-resumen.component';
import {NgxPaginationModule} from 'ngx-pagination'; // <-- import the module
// Servicios
import { DatabaseProductosService } from './servicios/database-productos.service';

const routes: Routes = [
  {path:"", redirectTo:"login",pathMatch:"full"},
  {path:"administracion",component:AdminComponent,
    children:[
      { path:"",redirectTo:"mesas",pathMatch:"full"},
      { path:"mesas",component:MesasComponent},
      { path:"mesas/:id",component:MesasComponent},
      { path:"pedidos",component:PedidosComponent},
      { path:"resumen-de-caja",component:ResumenCajaComponent},
      { path:"configuraciones",component:ConfiguracionesComponent}
    ]
  },
  {path:"login",component:LoginComponent},
  {path:"**",component:PageNotFoundComponent}
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
    PedidosdiariosComponent,
    FacturadosdiariosComponent,
    ResumenCajaComponent,
    ResumenDetailComponent,
    FuncionesResumenComponent,
    PageNotFoundComponent 
  ],
  imports: [
    RouterModule.forRoot(routes),
    CommonModule,
    FormsModule,
    FilterPipeModule,
    HttpClientModule,
    NgxPaginationModule
  ],
  providers:[
    DatabaseProductosService
  ],
  exports: [
    RouterModule,
  ]
})
export class AppRoutingModule { }
