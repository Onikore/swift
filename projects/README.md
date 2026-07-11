# Projects

This is where real iOS apps go — each one in its own subfolder, each one its own git repo
(a separate GitHub repo, since `builder` needs a repo to push a build workflow to).

## The catch: you need an actual Xcode project

`builder` (in [../tools/ios-builder](../tools/ios-builder)) builds an *existing* Xcode
project remotely via GitHub Actions — it doesn't generate one. A valid `.xcodeproj` is a
fiddly binary-ish plist format normally created by Xcode itself, and hand-writing one
without ever being able to test it locally (no Xcode/xcodebuild on Windows) is a good way
to end up with a project that silently fails to build in CI with no way to debug it here.

Two practical ways around that:

1. **Start from a known-good minimal template.** Search GitHub for a small MIT/Apache
   licensed "SwiftUI hello world" template repo, fork or clone it, then run `builder init`
   inside it. This gets you a project structure that's already proven to build with
   `xcodebuild`.
2. **Use a Mac once to scaffold, then develop from Windows.** If you (or a friend, or a
   cloud Mac) can run Xcode just once — File > New > Project > iOS App — push that empty
   project to GitHub, then do all further editing and building from Windows with `builder`.

Once a project has a valid `.xcodeproj` or `.xcworkspace` in it:

```bash
cd projects/your-app
../../bin/builder.exe auth github     # one-time GitHub auth
../../bin/builder.exe init            # detects the repo, adds .github/workflows/ios-build.yml
../../bin/builder.exe ios build       # triggers the build, downloads the IPA to ./dist/
```

See the main [tool README](../tools/ios-builder/README.md) for code signing, Flutter/React
Native hot reload via MobAI, and build-minute limits on the GitHub Actions free tier
(~15-20 builds/month).
