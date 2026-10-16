cask "tally" do
  version "0.2.0"
  sha256 "6971e305dc380fe52277cdb32500911f0f75eca7e273047f9f98496072a1db9d"

  url "https://github.com/eduardoborges/tally/releases/download/v#{version}/Tally.dmg"
  name "Tally"
  desc "Claude Code usage monitor for the menu bar and a desk display"
  homepage "https://github.com/eduardoborges/tally"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on formula: "esptool"
  depends_on formula: "jq"
  depends_on macos: :sonoma

  app "Tally.app"

  uninstall quit: "dev.eduardoborges.tally"

  zap trash: [
    "~/Library/Logs/Tally.log",
    "~/Library/Preferences/dev.eduardoborges.tally.plist",
  ]
end
