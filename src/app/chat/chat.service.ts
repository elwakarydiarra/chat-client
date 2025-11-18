import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class ChatService {
  private messageSubject = new BehaviorSubject<any>(null);
  public messages$ = this.messageSubject.asObservable();

  private channel: BroadcastChannel;

  constructor() {
    this.channel = new BroadcastChannel('chat');
    this.channel.onmessage = (event) => {
      this.messageSubject.next(event.data);
    };
  }

  sendMessage(message: any): void {
    this.channel.postMessage(message);
    this.messageSubject.next(message);
  }
}
