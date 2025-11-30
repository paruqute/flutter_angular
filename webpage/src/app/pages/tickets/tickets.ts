import { NgFor, NgIf } from '@angular/common';
import { Component } from '@angular/core';


interface Ticket {
  id: number;
  subject: string;
  status: 'Open' | 'In Progress' | 'Closed';
  createdAt: string;
}

@Component({
  selector: 'app-tickets',
  imports: [NgFor, NgIf],
  templateUrl: './tickets.html',
  styleUrl: './tickets.css',
})
export class Tickets{

  allTickets: Ticket[] = [
    { id: 1001, subject: 'App Crashing on Logout', status: 'Open', createdAt: '2025-10-25' },
    { id: 1002, subject: 'Missing profile picture', status: 'In Progress', createdAt: '2025-10-24' },
    { id: 1003, subject: 'Payment failed', status: 'Closed', createdAt: '2025-10-23' },
    { id: 1004, subject: 'Cannot reset password', status: 'Open', createdAt: '2025-10-22' },
    { id: 1005, subject: 'Server connection issues', status: 'Open', createdAt: '2025-10-21' },
    { id: 1006, subject: 'Typo on homepage banner', status: 'Closed', createdAt: '2025-10-20' },
  ];
  

  displayedTickets: Ticket[] = this.allTickets; 
  activeFilter: string = 'All'; 
 
  // Function to change the status
  filterTickets(status: string): void {
     this.activeFilter = status;
    if (status === 'All') {
      
      this.displayedTickets = this.allTickets;
    } else {
     
      this.displayedTickets = this.allTickets.filter(ticket => ticket.status === status);
    }
  }

 
  getStatusClass(status: string): string {
    switch (status) {
      case 'Open': 
        return 'bg-red-200 text-red-900'; 
      case 'In Progress': 
        return 'bg-yellow-200 text-yellow-900'; 
      case 'Closed': 
        return 'bg-green-200 text-green-900'; 
      default: 
        return 'bg-gray-200 text-gray-900';
    }
  }

  // count tickets for the button labels
  countTickets(status: string): number {
    if (status === 'All') {
        return this.allTickets.length;
    }
    return this.allTickets.filter(t => t.status === status).length;
  }
}