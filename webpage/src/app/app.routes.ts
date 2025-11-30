import { Routes } from '@angular/router';
import { Tickets } from './pages/tickets/tickets';
import { Knowledgebase } from './pages/knowledgebase/knowledgebase';
import { Logs } from './pages/logs/logs';

export const routes: Routes = [
  { path: '', redirectTo: 'tickets', pathMatch: 'full' },
  { path: 'tickets', component: Tickets },
  { path: 'knowledgebase', component: Knowledgebase },
  { path: 'logs', component: Logs },
];
