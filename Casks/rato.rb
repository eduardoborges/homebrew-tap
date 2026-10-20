cask "rato" do
  version "0.1.1"
  sha256 "3f6826b5eee70a45a9b17a688415a54f7d59ee9b594b48ee5cc58b89d80d4610"

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
