cask "zeca" do
  version "1.2.0"
  sha256 "0b1ca470ffe05a7e368b0b144d7c209e26aa93b500b112e374c41ae1a7b5f21c"

  url "https://github.com/eduardoborges/zeca/releases/download/v#{version}/ZecaAI.dmg"
  name "Zeca"
  desc "Meeting recorder with on-device transcription and AI summaries"
  homepage "https://zeca.eduardoborges.dev"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"

  app "ZecaAI.app"

  zap trash: [
    "~/Library/Application Support/ZecaAI",
    "~/Library/Preferences/com.zeca.Zeca.plist",
    "~/Library/Preferences/com.zeca.ZecaAI.plist",
  ]

  caveats <<~EOS
    This release is not notarized yet. If macOS reports the app as damaged,
    reinstall without quarantine:
      brew reinstall --cask --no-quarantine zeca
  EOS
end
