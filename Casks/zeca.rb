cask "zeca" do
  version "1.7.0"
  sha256 "501be9cc61fe49328b64168b6a5a30b7dfed219addf6f4be40265978a0e66d0e"

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
