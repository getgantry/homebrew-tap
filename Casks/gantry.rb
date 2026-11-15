cask "gantry" do
  version "0.29.0"
  sha256 "f537a443ce604ba99ded59bdaed046d2792b4b7585dc0d845306e1e11186972d"

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