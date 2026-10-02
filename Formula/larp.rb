class Larp < Formula
  desc "Local action runner with 1Password-backed secrets"
  homepage "https://github.com/brandoncarl/larp"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/brandoncarl/larp/releases/download/v0.1.6/larp-v0.1.6-darwin-arm64.tar.gz"
      sha256 "327023d0ca5d649eade6c26a524cf7141ee4edfefafae81d3aad7da9050bbf6b"
    end

    on_intel do
      url "https://github.com/brandoncarl/larp/releases/download/v0.1.6/larp-v0.1.6-darwin-x86_64.tar.gz"
      sha256 "5be90f2f9d25ca04771b3f62ef73811c8bd78de35a6b131703322f221df5cef4"
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
