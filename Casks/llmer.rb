# Template for the cask in michalito/homebrew-tap. scripts/release.sh fills in the
# version and checksum and pushes the result to the tap.
cask "llmer" do
  version "0.1.0"
  sha256 "26916ea1a2e656b82877851ced7421e829a80961549f57bacb2c97d8451ab302"

  url "https://github.com/michalito/homebrew-tap/releases/download/v#{version}/llmer-#{version}.zip"
  name "llmer"
  desc "Menu bar app showing the usage left on Claude and Codex subscriptions"
  homepage "https://github.com/michalito/homebrew-tap"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :tahoe"

  app "llmer.app"
  binary "llmer"

  # The build is signed with a self-signed certificate, not notarised by Apple, so
  # Gatekeeper would refuse the quarantined download. Clear the flag Homebrew set.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/llmer.app", "#{staged_path}/llmer"]
  end

  uninstall quit: "dev.llmer.app"

  zap trash: "~/Library/Application Support/llmer"

  caveats <<~EOS
    Sign-in tokens live in the Keychain and survive uninstalling; run
    `llmer logout ACCOUNT` for each account first if you want them gone.
  EOS
end
