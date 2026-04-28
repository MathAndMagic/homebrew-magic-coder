class MagicCoder < Formula
  desc "Magic Coder terminal UI"
  homepage "https://coder.bridgeapp.ai"
  license "LicenseRef-Proprietary"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.0.0/magic-coder-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "a890630691970f9d8ca798be3d4d15887b68fa233e51e771370519e86b56faa9"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.0.0/magic-coder-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "c9ff5be61d877d465dd0e5302fd4b02b5f4be8eb260b078f0064eaf0b85abd2e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.0.0/magic-coder-v1.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "43aff0263d4863cda4757adfe244f50dd457c37a375696176a5c128f2e6fb90b"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.0.0/magic-coder-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30729fd118274c0e77d0f5727911da53a6c804493373747c51a8e983359e6208"
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
