# OpenBL

OpenGL boilerplate/library/framework/engine idk something that make me code less
and copy-paste more.

## Features

By default, this template handles:

- Building
  + Native platform using GLFW
  + Web platform using WebAssembly and WebGL
- Window creation and event handling
- FPS display (Native only)
- Compiling and loading shader
- An example "Renderer":
  - Uniforms:
    + Resolution
    + Mouse position
    + Time
  - Shaders:
    + Vertex shader: Full-screen quad
    + Fragment shader: Time-varying color gradient that follows the mouse

## How to use

Don't. This is only for my use cases and programming style.

## How to use (but for me)

- Replace all `example` with the new project name using `grep` or something.

### Requirements

**Native build**

- A C99 compiler
- GNU make
- GLFW
- GLEW

**WebAssembly build**

- Clang
- A web server (ex: `python -m http.server`)

### Building

Running this will compile both the native version and the web version

```
make
```

### Debugging

Compile with debug symbols then use gdb to debug

```
make debug

gdb ./debug/app
```

### Running

For the native version, the executable is located at `./debug/app`

For the web version use a web server (See [above](#requirements)) to host the
website.

## Todo

- Better error reporting
- Build-time shader compilation error
- Texture loading
- Text renderer
- Ditch GLFW + GLEW for raw X11/Wayland/Win32
- ~~Ditch Linux/Windows for a custom operating system~~
- ~~Actually develop OpenGL software~~

## License

This project is licensed under the [MIT License](LICENSE).
