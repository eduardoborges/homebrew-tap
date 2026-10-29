cask "rato" do
  version "0.3.0"
  sha256 "60776f1ef6647d3eecbaff4d37bb18d112a73d041489a0aed47b505dd1ad39a0"

  url "https://github.com/eduardoborges/rato/releases/download/v#{version}/Rato.dmg"
  name "Rato"
  desc "Battery, DPI and polling rate for Logitech, ATK and VXE mice in the menu bar"
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
