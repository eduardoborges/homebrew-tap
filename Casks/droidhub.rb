cask "droidhub" do
  version "0.1.1"
  sha256 "49bacbfa67276d2f6c707bae8fa8d21eaef5d4a06a65f815b902aca23b07d809"

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
