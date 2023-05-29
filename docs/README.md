# Running Doom WASM on Docker Desktop on Mac M1 Pro

There is a meme in the IT community about running Doom on any device possible - be it calculators or really anything with a display. This repository provides a dockerized way to host Doom 1 as a webservice making it publicly available to any clients with a keyboard.

To run the image, you can wrap it in a `docker-compose.yml` like this:
```yaml
version: "3.8"
services:
  doom-wasm:
    image: ghcr.io/trisnol/doom-wasm:main
    plaform: linux/amd64
    restart: unless-stopped
    ports:
      - 8080:8000

```

## Running Compose

```
docker compose up -d
```

<img width="1235" alt="image" src="https://github.com/collabnix/doom-wasm-docker/assets/34368930/69d38a76-6c7b-4a9a-bb32-fc142ecd4c87">


## Accessing the app

Open https://localhost:8080 to access the app

<img width="1141" alt="image" src="https://github.com/collabnix/doom-wasm-docker/assets/34368930/2e9a5dea-8822-4cba-8179-7ad001349e7b">



