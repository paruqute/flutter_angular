
import { CommonModule } from '@angular/common';
import { ChangeDetectorRef, Component } from '@angular/core';


@Component({
  selector: 'app-logs',
  imports: [CommonModule],
  templateUrl: './logs.html',
  styleUrl: './logs.css',
})
export class Logs {
   logs: string[] = [];


   constructor(private cd: ChangeDetectorRef) {
    // Add a log every 2 seconds
    setInterval(() => this.addLog(), 2000);
  }

  addLog() {
    const levels = ['INFO', 'WARN', 'ERROR', 'DEBUG'];
    const level = levels[Math.floor(Math.random() * levels.length)];
    const time = new Date().toLocaleTimeString();
    const msg = `${time} [${level}] Random event happened`;

    this.logs.push(msg);

    this.cd.detectChanges();

    if (this.logs.length > 100) this.logs.shift();

    const el = document.getElementById('logBox');
    if (el) el.scrollTop = el.scrollHeight;
  }

  clearLogs() {
    this.logs = [];
      this.cd.detectChanges();
  }
}