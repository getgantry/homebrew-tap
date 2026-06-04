# homebrew-tap

Homebrew tap for [Gantry](https://github.com/andrewkomkov/gantry), a native
macOS Docker management app.

## Install

```sh
brew install --cask --no-quarantine andrewkomkov/tap/gantry
```

`--no-quarantine` is recommended because Gantry is not notarized; without it
macOS will refuse to open the app until the quarantine flag is cleared
manually:

```sh
xattr -dr com.apple.quarantine /Applications/Gantry.app
```

Updates ship through the app's built-in Sparkle updater (`auto_updates true`),
so `brew upgrade` is only needed to jump versions manually.
