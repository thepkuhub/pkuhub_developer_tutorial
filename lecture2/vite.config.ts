import { defineConfig } from "vite";

export default defineConfig({
  server: {
    host: "127.0.0.1",
    port: 3030,
    allowedHosts: ["localhost", "127.0.0.1", "slides.ethan02.com"],
    cors: {
      origin: [
        "http://localhost:3030",
        "http://127.0.0.1:3030",
        "https://slides.ethan02.com",
      ],
      methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
      allowedHeaders: ["Content-Type", "Authorization", "X-Requested-With"],
      credentials: true,
    },
  },
});
