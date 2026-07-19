class MagicCoder < Formula
  desc "Magic Coder terminal UI"
  homepage "https://coder.bridgeapp.ai"
  license "LicenseRef-Proprietary"
  version "1.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.5.1/magic-coder-v1.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "740a4328ae85b697be97cabbf9526cf7180e6676c023db546bce7b55e0764a56"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.5.1/magic-coder-v1.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "c38e6844bfe428e0132260779e9d103cffc925844479566c884c7dce97b5656b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.5.1/magic-coder-v1.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d38462e6e6fbadbf62b98a5e0c2ecf1cc9b07b7877b4d5202c6f2221ecd08abc"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.5.1/magic-coder-v1.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f397cffc0ba3d062be5da2d957bfda6cd97e7260f4174d9002217d9a89729449"
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
