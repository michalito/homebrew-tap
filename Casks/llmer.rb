cask "llmer" do
  version "0.1.1"
  sha256 "4ca8377a17bc8c3c971d1134e3550465e1ce9422e78efb03c10559a88fce55c5"

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
  binary "llmer"

  # The build is signed with a self-signed certificate, not notarised by Apple, so
  # Gatekeeper would refuse the quarantined download. Clear the flag Homebrew set.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/llmer.app", "{{staged_path}}/llmer"]
  end

  zap trash: "~/Library/Application Support/llmer"

  caveats <<~EOS
    Sign-in tokens live in the Keychain and survive uninstalling; run
    `llmer logout ACCOUNT` for each account first if you want them gone.
  EOS
end
