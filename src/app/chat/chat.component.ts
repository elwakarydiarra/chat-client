import { CommonModule } from '@angular/common';
import { Component, ChangeDetectorRef } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-chat',
  standalone: true,
  templateUrl: './chat.component.html',
  styleUrls: ['./chat.component.css'],
  imports: [CommonModule, FormsModule]
})
export class ChatComponent {
  messages: { sender: string; content: string }[] = [];
  newMessage = '';
  sender = 'client';
  private channel: BroadcastChannel;

  constructor(private cdr: ChangeDetectorRef) {
    this.channel = new BroadcastChannel('chat');
    this.channel.onmessage = (event) => {
      this.messages.push(event.data);
      this.cdr.detectChanges(); // force l’actualisation de la vue
    };
  }

  send(): void {
    const msg = {
      sender: this.sender,
      content: this.newMessage.trim()
    };

    if (msg.content) {
      this.messages.push(msg);
      this.channel.postMessage(msg);
      this.newMessage = '';
    }
  }
}
