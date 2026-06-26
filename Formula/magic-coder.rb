class MagicCoder < Formula
  desc "Magic Coder terminal UI"
  homepage "https://coder.bridgeapp.ai"
  license "LicenseRef-Proprietary"
  version "1.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.3.0/magic-coder-v1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "4a0632c6dc341fb589b09dcbff133cf6280741963afce65bd318f29a7abb2e25"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.3.0/magic-coder-v1.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "9cd03e7df12dba39c08537a88fd1139f2e0adbfff54fe3f270f5abed3e146b21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.3.0/magic-coder-v1.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "405fe9e6d6f02b0b474081ba09dceb877ea741be52d8961159b1ac29638cceab"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.3.0/magic-coder-v1.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba191cd9986fcf743cf89841b5416013551297d4c948474d9abf80cf972c5dfd"
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
