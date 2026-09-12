cask "droidhub" do
  version "0.1.0"
  sha256 "0b895e96cefd08eed949824abd0c01274e4627797e608d9500af9c1ce6212988"

  url "https://github.com/eduardoborges/droidhub/releases/download/v#{version}/DroidHub.dmg"
  name "DroidHub"
  desc "Android device hub with a live, clickable emulator screen"
  homepage "https://github.com/eduardoborges/droidhub"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "DroidHub.app"

  zap trash: [
    "~/Library/Preferences/com.eduardo.droidhub.plist",
    "~/Library/Saved Application State/com.eduardo.droidhub.savedState",
  ]
end
