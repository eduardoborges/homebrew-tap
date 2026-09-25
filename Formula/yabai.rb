class Yabai < Formula
  desc "Tiling window manager for macOS based on binary space partitioning"
  homepage "https://github.com/eduardoborges/yabai"
  url "https://github.com/eduardoborges/yabai.git",
      revision: "e694eaa33ee230dd5bbf4df9131e662dc61530ba"
  version "7.1.25"
  license "MIT"
  revision 2
  head "https://github.com/eduardoborges/yabai.git", branch: "macos-27"

  depends_on xcode: :build
  depends_on arch: :arm64
  depends_on macos: :monterey

  def install
    system "make", "-j1", "install"
    bin.install "bin/yabai"
    (pkgshare/"examples").install "examples/yabairc", "examples/skhdrc"
    man1.install "doc/yabai.1"
  end

  def caveats
    <<~EOS
      The build sandbox can't read your keychain. Sign the binary after every install or upgrade so it keeps its Accessibility and Screen Recording permissions:
        codesign -fs yabai-cert /opt/homebrew/Cellar/yabai/7.1.25_2/bin/yabai

      The scripting-addition sudoers entry is pinned to the binary hash, so update it after every install or upgrade. Edit it with:
        sudo visudo -f /private/etc/sudoers.d/yabai
      and paste the row printed by:
        echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa"
    EOS
  end

  test do
    assert_match "yabai-v#{version}", shell_output("#{bin}/yabai --version")
  end
end
