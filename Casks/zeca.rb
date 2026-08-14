cask "zeca" do
  version "1.4.0"
  sha256 "aebe2d67628249b4d05ae221cc0ffb3b5de096dd6c449819f44374d8fc5a1aea"

  url "https://github.com/eduardoborges/zeca/releases/download/v#{version}/Zeca.dmg"
  name "Zeca"
  desc "Meeting recorder with on-device transcription and AI summaries"
  homepage "https://zeca.eduardoborges.dev"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "Zeca.app"

  zap trash: [
    "~/Library/Application Support/Zeca",
    "~/Library/Application Support/ZecaAI",
    "~/Library/Preferences/com.zeca.Zeca.plist",
    "~/Library/Preferences/com.zeca.ZecaAI.plist",
  ]
end
