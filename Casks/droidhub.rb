cask "droidhub" do
  version "0.4.0"
  sha256 "c6ab13bab84be227993bcda78eb5cd8cf25f29962c6df0a1da061ce705c64423"

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
