# Linux Process Visualizer

Explore running Linux processes as an interactive 3D graph built with C++ and raylib. Each sphere represents a process, and lines connect parents to their children. Sphere color shows the CPU usage range, and sphere size reflects resident memory usage.

Click a process to see its name, PID, parent PID, CPU usage, and memory in the inspector. The graph refreshes about once a second as processes start, exit, and change their resource usage.

## Build and run

You’ll need a Linux desktop with `/proc`, an OpenGL 3.3-capable graphics driver, GNU Make, and `g++` with C++20 and `std::format` support (GCC 13 or newer). The Makefile links against raylib, OpenGL, and X11, so install their development headers and libraries. See the [raylib GNU/Linux setup guide](https://github.com/raysan5/raylib/wiki/Working-on-GNU-Linux) for distribution-specific instructions.

From the repository root, run:

```sh
make
./compiled/program
```

Launch the executable from the repository root so it can find `shaders/` and `assets/fonts/`.

## Controls

- **Left-click a sphere** to inspect its process. Click empty space to clear the selection.
- **Right-click and drag** to orbit the scene.
- **Scroll** to zoom. Scroll in with a process selected to focus on it.
- **R** to reset the camera to the graph overview.

## How it works

- [`src/process/`](src/process/) reads process metadata and resident memory from `/proc/<pid>/status` and measures CPU usage from changes in `/proc/<pid>/stat` between samples. One fully used logical CPU counts as 100%, so a process using multiple cores can exceed 100%.
- [`src/renderer/`](src/renderer/) draws the graph and inspector, handles process picking, and controls the camera.
- [`src/core/`](src/core/) runs the application loop and passes process snapshots to the renderer.

The bundled Ubuntu Sans and Ubuntu Sans Mono fonts are covered by the [included font license](assets/fonts/LICENSE.txt).
