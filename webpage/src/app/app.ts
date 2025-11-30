import { Component, signal } from '@angular/core';
import { Navbar } from './navbar/navbar';
import { Tickets } from './pages/tickets/tickets';
import { Knowledgebase } from './pages/knowledgebase/knowledgebase';
import { Logs } from './pages/logs/logs';
import { RouterOutlet } from '@angular/router';


@Component({
  selector: 'app-root',
  imports: [
   RouterOutlet,
   Navbar
  ],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected readonly title = signal('angular-app');
}
