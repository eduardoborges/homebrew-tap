cask "rato" do
  version "0.1.2"
  sha256 "0dc719fc8052e7981960d0772682d1c374b17526c184f5c6732835452b6014ff"

  url "https://github.com/eduardoborges/rato/releases/download/v#{version}/Rato.dmg"
  name "Rato"
  desc "Logitech mouse battery, DPI, polling rate and lighting in the menu bar"
  homepage "https://github.com/eduardoborges/rato"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Rato.app"

  uninstall quit: "dev.eduardoborges.rato"

  zap trash: [
    "~/Library/Application Support/Rato",
    "~/Library/Preferences/dev.eduardoborges.rato.plist",
  ]
end
