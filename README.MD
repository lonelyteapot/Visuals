# Visuals

A personal project for visualizing various algorithms

## Building instructions

### For Windows

- Install Qt binaries for MinGW ([installer](https://www.qt.io/download)).  
  _Recommended version is 6.2.1. Qt5 may not work._
- Build using Qt Creator or manually with `cmake`.
- Run `Visuals.exe`.

### For Web

- Install Qt binaries for WebAssembly ([installer](https://www.qt.io/download)).  
  _Recommended version is 6.2.1. Qt5 may not work._
- Install Emscripten ([installer](https://emscripten.org/docs/getting_started/downloads.html)).  
  _Recommended version is 2.0.14, not the latest._
- Build using Qt Creator or manually with `cmake`.
  output file  | description
  -------------|------------
  Visuals.wasm | Application binary
  Visuals.js   | Emscripten runtime
  Visuals.html | Defaul page container
  qtloader.js  | Qt runtime
- Run with `emrun Visuals.html` or any HTTP server.
