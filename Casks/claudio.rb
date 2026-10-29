cask "claudio" do
  version "0.4.0"
  sha256 "ce8b72b6aa95bf61e37f4cbaf95aef52cebd1c158d682199eabe688767af70a9"

  url "https://github.com/eduardoborges/claudio/releases/download/v#{version}/Claudio.dmg"
  name "Claudio"
  desc "Claude Code usage monitor for the menu bar and a desk display"
  homepage "https://github.com/eduardoborges/claudio"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on formula: "esptool"
  depends_on formula: "jq"
  depends_on macos: :sonoma

  app "Claudio.app"

  uninstall quit: "dev.eduardoborges.claudio"

  zap trash: [
    "~/Library/Logs/Claudio.log",
    "~/Library/Preferences/dev.eduardoborges.claudio.plist",
  ]
end
