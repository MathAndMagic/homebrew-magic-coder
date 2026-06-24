class MagicCoder < Formula
  desc "Magic Coder terminal UI"
  homepage "https://coder.bridgeapp.ai"
  license "LicenseRef-Proprietary"
  version "1.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.2.0/magic-coder-v1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "f5ab2f5d469785625ec3325aa663971bed5642d7b2c17271c5d64af374de00d7"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.2.0/magic-coder-v1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "604cbb7c474d3205a696562cd15e6354635f2bfc6731aa4415cbb521630103c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.2.0/magic-coder-v1.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d542a4ad910be247022c09f9645d991d697c5f31c4cb2e1dcd7a5e4d9110995"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.2.0/magic-coder-v1.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e4bbd2843a9e3df8b324980ef555bc4d24085897c602556b2227242be242675"
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
