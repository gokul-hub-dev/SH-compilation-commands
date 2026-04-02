# SH-compilation-commands

This repository contains a small C example with separate source files and a build helper script.

## Build helper agent

Use `build-agent.sh` to perform common build actions for this workspace.

Examples:

  ./build-agent.sh status
  ./build-agent.sh build
  ./build-agent.sh build_shared
  ./build-agent.sh run
  ./build-agent.sh clean

The script wraps `build.sh` and provides a simple interface for build, rebuild, clean, and execution.

Use `./build.sh build_shared` or `./build-agent.sh build_shared` to create a shared library (`libcallfunc.so`) and a binary (`exe_shared`) with debug symbols.
