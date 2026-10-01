cask "llmer" do
  version "0.1.6"
  sha256 "5e240e4078cbf55789892c7d8c13d391e0c3b86213c4a89ff201a92ffeec022b"

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
end
