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
