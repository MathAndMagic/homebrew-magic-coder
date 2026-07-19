class MagicCoder < Formula
  desc "Magic Coder terminal UI"
  homepage "https://coder.bridgeapp.ai"
  license "LicenseRef-Proprietary"
  version "1.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.5.0/magic-coder-v1.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "846686c495e890a69943b1b8e1824c52e85e40b29b16b399a766aa14d00b9383"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.5.0/magic-coder-v1.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "7508e4bbd75f6101dd7eadfa0cf430f47a27be9a63ae09f079679ba50ffbdad8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.5.0/magic-coder-v1.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe227fa138e3179cb47e1d59af4ac34c2841172ecf642049228f4c66db74045a"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.5.0/magic-coder-v1.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d10047d89c87b1f843de5a2c6fce6cc16cab543069d3c3745cc2388eff6747ef"
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
