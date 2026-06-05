cask "gantry" do
  version "0.4.1"
  sha256 "c284cbe02ad6339e45a3dd751dcb42e562720f5e5f2ace42a8975f2d7660e55b"

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
