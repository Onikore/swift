# Swift workspace

## Layout

- `learning/` — Swift language lessons, numbered in order. Each `.swift` file runs standalone.
- `projects/` — real iOS apps, one per subfolder, each its own git repo. See [projects/README.md](projects/README.md).
- `tools/ios-builder/` — cloned source of the [builder CLI](https://github.com/MobAI-App/ios-builder), used to build iOS apps via GitHub Actions without a Mac.
- `bin/builder.exe` — the compiled `builder` CLI (Windows), already on hand — invoke it directly or add `bin/` to your PATH.
- `run.ps1` — helper to compile+run any lesson file.
- `notes/` — your own notes as you go.

## Running a lesson

```powershell
.\run.ps1 learning\01-basics\01_hello_world.swift
```

(`swift file.swift` interpreter mode hits a JIT bug on this Windows toolchain build —
`run.ps1` works around it by compiling with `swiftc` first.)

## Suggested order

1. `01-basics` — variables, constants, types
2. `02-collections-control-flow` — arrays, dicts, sets, loops, switch
3. `03-functions-closures` — functions, closures, higher-order functions
4. `04-oop-structs-classes` — value vs. reference types, inheritance
5. `05-protocols-generics` — protocols, generics
6. `06-error-handling` — optionals, `do/try/catch`
7. `07-concurrency-async-await` — `async`/`await`, task groups
8. `08-swiftui-intro` — reference-only; SwiftUI needs `builder`/Xcode to actually run

## Building real iOS apps

`builder` builds iOS apps (native Swift, Flutter, React Native, Cordova/Ionic) remotely via
GitHub Actions — no Mac needed for the build itself. Quick start once you have a project
with a valid Xcode project file (see [projects/README.md](projects/README.md)):

```powershell
.\bin\builder.exe auth github
cd projects\your-app
..\..\bin\builder.exe init
..\..\bin\builder.exe ios build
```

Installing an IPA on a physical device, and hot reload for Flutter/React Native, needs
[MobAI](https://mobai.run) — simulators aren't supported.
