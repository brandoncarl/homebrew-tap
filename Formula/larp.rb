class Larp < Formula
  desc "Local action runner with 1Password-backed secrets"
  homepage "https://github.com/brandoncarl/larp"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/brandoncarl/larp/releases/download/v0.1.4/larp-v0.1.4-darwin-arm64.tar.gz"
      sha256 "57784886ad0559a8dc63ef685c9227030b8bf263a0f3887c1e0f68ac48d4af77"
    end

    on_intel do
      url "https://github.com/brandoncarl/larp/releases/download/v0.1.4/larp-v0.1.4-darwin-x86_64.tar.gz"
      sha256 "9ad6f991ac96484c4463f48179cfbacd8704ff18a3d91cfe944edb8c82e5b42f"
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
