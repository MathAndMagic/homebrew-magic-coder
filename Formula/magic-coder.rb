class MagicCoder < Formula
  desc "Magic Coder terminal UI"
  homepage "https://coder.bridgeapp.ai"
  license "LicenseRef-Proprietary"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.1.0/magic-coder-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "6e7cd070b50c1edc2c1ad20fbb61cb60f8439a4d5aa4a2b84647caa2a037a139"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.1.0/magic-coder-v1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "1c4bccca2bce1b92196901f87fe9de0547229e94b63419bac0c862d5764769f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.1.0/magic-coder-v1.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c11fec9fd082f62df896995237b6eef88b9a069df6f368cb9ba09f91c43fb9c2"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.1.0/magic-coder-v1.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8cee87dea4a9aa2005d4ad125618df1922bb7fed96ebf19bdfb682c3cc1f887b"
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
