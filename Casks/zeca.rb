cask "zeca" do
  version "1.3.0"
  sha256 "2637688dfc88c3157618741f1acd0e6f091a330b880f0030a21a38a5b7a3a288"

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
