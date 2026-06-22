class MagicCoder < Formula
  desc "Magic Coder terminal UI"
  homepage "https://coder.bridgeapp.ai"
  license "LicenseRef-Proprietary"
  version "1.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.1.1/magic-coder-v1.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "c1606110fa9cdbca0dc323787370d1423444a06d02be13afa186c1c8be92603a"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.1.1/magic-coder-v1.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "89908f944fb8b9bc72c2b89a6980e1f6e1868d575d2692bf17a458efef3f0dac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.1.1/magic-coder-v1.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "962b596b36873e50a52230edba94fa3e76b7ea0d010683ff9c66cc7640e24876"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.1.1/magic-coder-v1.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a12d681c3ac6cd4383c5afafa9eab2150bc45cf8b430c6c539d74326a86a37c1"
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
