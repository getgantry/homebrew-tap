cask "gantry" do
  version "0.4.5"
  sha256 "a8c6e0df9dab0d4cdca03b6d758aa7ffd27f976897471fc1f451ba0b8bd1ba8e"

  url "https://github.com/andrewkomkov/gantry/releases/download/v#{version}/Gantry-#{version}.zip"
  name "Gantry"
  desc "Docker management app for local and remote (SSH) hosts"
  homepage "https://github.com/andrewkomkov/gantry"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
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
