cask "gantry" do
  version "0.4.2"
  sha256 "5450f10591700ad6759f67eec83cf06459772a1efcc097dddc8b668f49026b2f"

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
