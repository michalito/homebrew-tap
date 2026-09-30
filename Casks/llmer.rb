cask "llmer" do
  version "0.1.3"
  sha256 "8bbdc594cb33799488ac41e8ac166d03b662705d649a58f6f90caaf6ef9b0e7a"

  url "https://github.com/michalito/homebrew-tap/releases/download/v#{version}/llmer-#{version}.zip"
  name "llmer"
  desc "Menu bar app showing the usage left on Claude and Codex subscriptions"
  homepage "https://github.com/michalito/homebrew-tap"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "llmer.app"
  # The CLI lives in the bundle, at a path that upgrades keep, so the Keychain access
  # granted to it stays valid.
  binary "#{appdir}/llmer.app/Contents/MacOS/llmer-cli", target: "llmer"

  # The build is signed with a self-signed certificate, not notarised by Apple, so
  # Gatekeeper would refuse the quarantined download. Clear the flag Homebrew set.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/llmer.app"]
  end

  zap trash: "~/Library/Application Support/llmer"

  caveats <<~EOS
    Sign-in tokens live in the Keychain and survive uninstalling; run
    `llmer logout ACCOUNT` for each account first if you want them gone.
  EOS
end
