import { Component } from '@angular/core';
import { WebsocketService } from "./websocket.service";

@Component({
  selector: "app-root",
  templateUrl: "./app.component.html",
  styleUrls: ["./app.component.css"],
  providers: [WebsocketService]
})

export class AppComponent {
  title = 'client';
  LEDStatus = "off"

  constructor(private WebsocketService: WebsocketService) {
    WebsocketService.messages.subscribe(msg => {
      this.LEDStatus = (msg.status);
      console.log("Response from websocket: " + msg.status);
    });
  }
}