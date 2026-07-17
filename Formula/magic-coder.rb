class MagicCoder < Formula
  desc "Magic Coder terminal UI"
  homepage "https://coder.bridgeapp.ai"
  license "LicenseRef-Proprietary"
  version "1.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.4.2/magic-coder-v1.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "1b56706b7c29855da18fa8456ace3eb58ae7c3e48d8ea24668148528baa5324a"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.4.2/magic-coder-v1.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "2137feef999ce5646c4e618fc5b2d52e4284970afdd97aa2f8a4bf0aaed23f13"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.4.2/magic-coder-v1.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2544942a1c8a931b5bf272fb14d1c13eb10a9cd5a4f6293834bb1fa15fef0d5"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.4.2/magic-coder-v1.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47005d3317f9e7e1c41f9e1b2a1b4c80cd7a0df3de74ddfe73899c058a05aeb2"
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
