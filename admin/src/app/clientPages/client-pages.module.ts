import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { SharedModule } from "../shared/shared.module";
import { CLIENT_PAGES_ROUTES } from './clientPage.routes';
import { ClientPagesComponent } from './client-pages.component';
import { PerfilComponent } from './perfil/perfil.component';
import { PeliculasComponent } from './peliculas/peliculas.component';
import { LibrosComponent } from './libros/libros.component';
import { MusicaComponent } from './musica/musica.component';
import { MetodosPagoComponent } from './metodos-pago/metodos-pago.component';
import { PagoTarjetaComponent } from './pago-tarjeta/pago-tarjeta.component';
import { PagoEasypayComponent } from './pago-easypay/pago-easypay.component';
import { HttpClientModule } from '@angular/common/http';
import { ClientSidebarComponent } from './components/client-sidebar/client-sidebar.component';
import { AuthGuardService } from '../services/auth-guard.service';


@NgModule({
  declarations: [ClientPagesComponent, PerfilComponent, PeliculasComponent, LibrosComponent, MusicaComponent, MetodosPagoComponent, PagoTarjetaComponent, PagoEasypayComponent, ClientSidebarComponent],
  imports: [
    CommonModule,HttpClientModule,FormsModule,SharedModule,CLIENT_PAGES_ROUTES
  ],
  providers: [AuthGuardService]
})
export class ClientPagesModule { }
