class Larp < Formula
  desc "Local action runner with 1Password-backed secrets"
  homepage "https://github.com/brandoncarl/larp"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/brandoncarl/larp/releases/download/v0.1.5/larp-v0.1.5-darwin-arm64.tar.gz"
      sha256 "751e25dc55da4a6e66fed4dc0533e00a3d23c9f647b5f83b6f53ea0dac659af8"
    end

    on_intel do
      url "https://github.com/brandoncarl/larp/releases/download/v0.1.5/larp-v0.1.5-darwin-x86_64.tar.gz"
      sha256 "5ba922de83c688fbe154eab41bbf8e111896ffbdd5ecf356130874a0036cab77"
    end
  end

  def install
    bin.install "larp"
    doc.install "README.md", "QUICKSTART.md", "LICENSE"
  end

  def caveats
    <<~EOS
      Install the 1Password CLI and enable 1Password MCP before running LARP.
      Run `larp admin` to configure it, then `larp start` in a separate terminal.
    EOS
  end

  test do
    assert_match "larp admin", shell_output("#{bin}/larp help")
  end
end
