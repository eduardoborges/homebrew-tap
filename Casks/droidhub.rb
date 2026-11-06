cask "droidhub" do
  version "0.3.0"
  sha256 "434a5f375a05c09a27a8c148e2355b9fa44d85ae3dc3a428d55201132fb192f6"

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
