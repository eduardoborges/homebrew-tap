cask "tally" do
  version "0.1.0"
  sha256 "552992a159f5ab5d078d1622a70e860e89dd734ad16f6da7873b4a38f6824606"

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
