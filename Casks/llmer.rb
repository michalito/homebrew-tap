cask "llmer" do
  version "0.1.7"
  sha256 "b67ce288b2118e8e6f0eb240971fd6ef3068804747f59ffcb1009da06e984b64"

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
