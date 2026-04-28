class MagicCoder < Formula
  desc "Magic Coder terminal UI"
  homepage "https://coder.bridgeapp.ai"
  license "LicenseRef-Proprietary"
  version "0.29.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v0.29.0/magic-coder-v0.29.0-aarch64-apple-darwin.tar.gz"
      sha256 "561c440c250bfd7e6b5305402631e39e0febc01a4acb7496da5b4244ab52de97"
    else
      url "https://github.com/MathAndMagic/magic-coder-tui-releases/releases/download/v0.29.0/magic-coder-v0.29.0-x86_64-apple-darwin.tar.gz"
      sha256 "d63beebbef02edcb712004f5737c93a9c965274b34cb6998b200c76fc20afe7d"
    end
  end

  depends_on :macos

  def install
    bin.install "coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coder --version")
  end
end
