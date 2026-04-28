class MagicCoder < Formula
  desc "Magic Coder terminal UI"
  homepage "https://coder.bridgeapp.ai"
  license "LicenseRef-Proprietary"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.0.0/magic-coder-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "59e65dc00611a23ad3e109bbd6ba3e711b148e13e6a8341a35de73edf5b8be06"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.0.0/magic-coder-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "4ba043be2eea7d1852e08ae49e655c21b462766e3cb7846549b91669b13b3fc2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.0.0/magic-coder-v1.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5247aba3431e1c3c5869fe858fe888212eee4ff73b4c2babb8ed3cea81afcd9"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.0.0/magic-coder-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "693687304d789d641d09791a8991c2efaafd6ac5911d7d5d2bcd9b06d36ec41b"
    end
  end

  def install
    if OS.linux? && !Hardware::CPU.intel? && !Hardware::CPU.arm?
      odie "magic-coder Homebrew support on Linux currently requires x86_64 or arm64"
    end

    bin.install "coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coder --version")
  end
end
