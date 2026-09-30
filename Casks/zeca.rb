cask "zeca" do
  version "1.5.0"
  sha256 "40f15884ef357d71e96519f1143c64d15c16f9daf7a84af4acea1761023074c3"

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
