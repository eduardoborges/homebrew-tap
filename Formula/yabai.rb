class Yabai < Formula
  desc "Tiling window manager for macOS based on binary space partitioning"
  homepage "https://github.com/eduardoborges/yabai"
  url "https://github.com/eduardoborges/yabai.git",
      revision: "f211ac89693237fe2762af66f0fff6e8d9ced00e"
  version "7.1.25"
  license "MIT"
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
