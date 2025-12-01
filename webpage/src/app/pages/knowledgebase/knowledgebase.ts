import { NgClass, NgIf } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Component } from '@angular/core';
import { marked } from 'marked'; 

@Component({
  selector: 'app-knowledgebase',
  imports: [FormsModule, NgIf, NgClass],
  templateUrl: './knowledgebase.html',
  styleUrl: './knowledgebase.css',
})
export class Knowledgebase {

  editorContent: string = '# Article content\n\nStart writing your content here.';
  
  
  showPreview: boolean = false;
  
  
  saveMessage: string = '';

  
  get previewHtml(): string {
  
    return marked.parse(this.editorContent) as string;
  }

  // Save button 
  onSave(): void {
    console.log('Content Saved:', this.editorContent);
    this.saveMessage = 'Article saved successfully';
    
    // Clear the message after 3 seconds
    setTimeout(() => this.saveMessage = '', 3000);
  }
}
