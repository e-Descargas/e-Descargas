import { Component, OnInit } from '@angular/core';
import { MusicaService } from 'src/app/services/musica.service';
import { AlertService } from 'src/app/services/alert.service';
import { Musica } from 'src/app/models/musica';

@Component({
  selector: 'app-musica',
  templateUrl: './musica.component.html',
  styleUrls: ['./musica.component.css']
})
export class MusicaComponent implements OnInit {

  constructor(private service: MusicaService, private alert: AlertService) { }

  objetos: Musica[] = [];

  ngOnInit() {
    this.cargar();
  }

  cargar() {
    this.service.obtener().subscribe(data => {
      this.objetos = data;
    })
  }

  delete(id:string){
    this.alert.preConfirmLoading('¿Esta seguro?', 'La acción eliminará el objeto.', () => new Promise((resolve, reject) => {
      this.service.eliminar(id).subscribe(result => {
        this.cargar();
        resolve('Elemento eliminado correctamente!')
      }, error => reject('No se pudo eliminar el objeto.'))
    }))
  }

}
