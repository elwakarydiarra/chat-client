// src/main.ts
(window as any).global = window;

import { bootstrapApplication } from '@angular/platform-browser';
import { App } from './app/app';
import { appConfig } from './app/app.config';

import { Buffer } from 'buffer';

(window as any).global = window;
(window as any).Buffer = Buffer;
(window as any).process = { env: {} };


bootstrapApplication(App, appConfig)
  .catch((err) => console.error(err));
