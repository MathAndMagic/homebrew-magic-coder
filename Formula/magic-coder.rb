class MagicCoder < Formula
  desc "Magic Coder terminal UI"
  homepage "https://coder.bridgeapp.ai"
  license "LicenseRef-Proprietary"
  version "1.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.1.1/magic-coder-v1.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "64f9f90fe5cf7015f3fff4973c69dfebd6052afb5d556442055dbcd9547ca515"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.1.1/magic-coder-v1.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "68931bc9154bdccc9cef6e1650c4e2f19b6dbef4871ed1aded15cce53b0a43ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.1.1/magic-coder-v1.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "27d650b68619868459789eabc06ce120bda4d4abdcd011d537e0d043b98c170c"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.1.1/magic-coder-v1.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "25f0ecd949514b8c50d623be7736af9ad6ed526bb54a587302dd8583dd75a07d"
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
