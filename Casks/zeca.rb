cask "zeca" do
  version "1.6.0"
  sha256 "473846a57eea4e3b5565e7720fb0d1462fbe052a4b9b0da093eb7c1cdb12fb88"

  url "https://github.com/eduardoborges/zeca/releases/download/v#{version}/Zeca.dmg"
  name "Zeca"
  desc "Meeting recorder with on-device transcription and AI summaries"
  homepage "https://zeca.eduardoborges.dev"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Zeca.app"

  zap trash: [
    "~/Library/Application Support/Zeca",
    "~/Library/Application Support/ZecaAI",
    "~/Library/Preferences/com.zeca.Zeca.plist",
    "~/Library/Preferences/com.zeca.ZecaAI.plist",
  ]
end
