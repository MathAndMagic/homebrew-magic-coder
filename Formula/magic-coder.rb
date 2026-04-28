class MagicCoder < Formula
  desc "Magic Coder terminal UI"
  homepage "https://coder.bridgeapp.ai"
  license "LicenseRef-Proprietary"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.0.1/magic-coder-v1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "d9f51459d9f05de2663dcb731754e872d42bdd9f783afd6b9847ab06b0495d04"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.0.1/magic-coder-v1.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "78abd3926965d018a80bb951e6e9679f86d9f00bb32dca6296b7b8eea4d7fb7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.0.1/magic-coder-v1.0.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bb141211b43b625a20452711ec532b7b9be3d94dece3b1a78c02346fcddbb3b8"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.0.1/magic-coder-v1.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a62e34f3f123dbdd396163d3edf3b4dbb6e37ffc1f6941cb222edbd5ec5bd853"
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
