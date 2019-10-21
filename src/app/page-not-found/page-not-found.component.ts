import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-page-not-found',
  template: `
    <h1>
      Lo sentimos esta pagina no existe dentro de nuestra app!
    </h1>
  `,
  styles: []
})
export class PageNotFoundComponent implements OnInit {

  constructor(private router:Router) { }

  ngOnInit() {
    this.router.navigate(['login']);
  }

}
