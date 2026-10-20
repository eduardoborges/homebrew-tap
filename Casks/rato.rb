cask "rato" do
  version "0.1.0"
  sha256 "3603a4d411e2259e2e18395e3f8c0f7395372e5d1668bfbad454fdd93ef0ad0e"

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
