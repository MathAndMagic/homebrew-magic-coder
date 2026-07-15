class MagicCoder < Formula
  desc "Magic Coder terminal UI"
  homepage "https://coder.bridgeapp.ai"
  license "LicenseRef-Proprietary"
  version "1.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.4.1/magic-coder-v1.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "c8dac03d3c165c1ccc06709c631359f77b2797f6dbed75d9254b33097e033c26"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.4.1/magic-coder-v1.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "0640e4812a4dc23716e31b4ab8a92c8e1f4ef85a80393be6952ea0155c3d4e03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.4.1/magic-coder-v1.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "347c58c5ecc917ab083cc63705bf038eadc0b68da3e01f158b6b774c57169366"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v1.4.1/magic-coder-v1.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d468d2d5979b95403b2c6c6e18b8d7dff6779116540f11332ebe24825e0e54a3"
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
