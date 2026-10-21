cask "rato" do
  version "0.2.0"
  sha256 "d63b6f1da61984ae87ed7b884e91e7cded09a178d7d04678aa29ae1ed9b5660e"

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
