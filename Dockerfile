FROM emscripten/emsdk:3.1.36 as build

WORKDIR /tmp
RUN apt-get update
RUN apt-get install dh-autoreconf autogen automake libtool shtool pkg-config -y

RUN git clone https://github.com/cloudflare/doom-wasm.git
WORKDIR /tmp/doom-wasm
RUN ls -l
RUN ./scripts/clean.sh
RUN ./scripts/build.sh

FROM ubuntu:22.04

WORKDIR /opt
COPY --from=build /tmp/doom-wasm ./
RUN apt-get update && apt-get install curl python3 pip -y
RUN python3 -m pip install flask
RUN python3 -m pip install gunicorn
RUN curl -o ./src/doom1.wad https://distro.ibiblio.org/slitaz/sources/packages/d/doom1.wad
WORKDIR /opt/src

COPY app.py .
EXPOSE 8080
CMD gunicorn --bind :8080 app:app