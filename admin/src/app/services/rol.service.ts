import { Injectable } from '@angular/core';
import { CRUDService } from './CRUDService';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class RolService extends CRUDService<any> {

  constructor(private http: HttpClient) {
    super(http, 'roles')
  }
}
