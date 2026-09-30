# michalito/homebrew-tap

Homebrew tap for llmer, a macOS menu bar app that shows
how much usage is left on your Claude and Codex subscriptions. Requires macOS 26 or later.

```sh
brew install --cask michalito/tap/llmer   # app in /Applications, `llmer` on the PATH
brew upgrade --cask llmer                 # update
brew uninstall --cask llmer               # remove (add --zap to delete its data too)
```

The releases on this repository hold the built app and command line tool. The source is not public.
A running app relaunches itself into the new version after `brew upgrade`.

## Installing by hand

Download `llmer-<version>.zip` from the [releases page](https://github.com/michalito/homebrew-tap/releases),
unzip it, and move `llmer.app` to your Applications folder. The app is signed with a self-signed
certificate rather than notarised by Apple, so the first time you open it macOS will refuse; go to
System Settings > Privacy & Security and choose "Open Anyway", then open it again. The `llmer`
command is inside the bundle, at `llmer.app/Contents/MacOS/llmer-cli`; link it somewhere on your
PATH if you want it. Homebrew does all of this for you and also handles updates.
