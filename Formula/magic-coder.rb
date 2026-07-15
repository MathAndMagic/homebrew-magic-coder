class MagicCoder < Formula
  desc "Magic Coder terminal UI"
  homepage "https://coder.bridgeapp.ai"
  license "LicenseRef-Proprietary"
  version "1.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.4.0/magic-coder-v1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "2cd00fb24728d80f97ebf0ff8cdf66d4f99b38bbd85d7aab5ef1ffa722f5a9db"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.4.0/magic-coder-v1.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "87596761875a6c29ff5594b7191b122c66a4cbedd4a27b71a9ab831a039d6cea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.4.0/magic-coder-v1.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "82d7db2619c94681bad70c6b96fa0746a621cccd849b4c0fc7759784964b8cca"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.4.0/magic-coder-v1.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a5a1446c7eea6fd053e6792b25bbb6a668c60656f3c6d8739b1d3732ec960b6"
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
