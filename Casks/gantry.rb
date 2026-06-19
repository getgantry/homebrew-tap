cask "gantry" do
  version "0.18.1"
  sha256 "34d8f2b47dece829e8e24aa7c5ade97d780299d2c1be46e94fd47a8dd24ca214"

  url "https://github.com/getgantry/gantry/releases/download/v#{version}/Gantry-#{version}.zip"
  name "Gantry"
  desc "Docker and apple/container management app for local and remote (SSH) hosts"
  homepage "https://github.com/getgantry/gantry"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :tahoe

  app "Gantry.app"

  zap trash: [
    "~/Library/Application Support/Gantry",
    "~/Library/Caches/com.andrewkomkov.Gantry",
    "~/Library/Preferences/com.andrewkomkov.Gantry.plist",
    "~/Library/Saved Application State/com.andrewkomkov.Gantry.savedState",
  ]

  caveats <<~EOS
    Gantry is not notarized. If macOS refuses to open it, clear the
    quarantine flag after installation:

      xattr -dr com.apple.quarantine "/Applications/Gantry.app"
  EOS
end