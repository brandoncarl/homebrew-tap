class Larp < Formula
  desc "Local action runner with 1Password-backed secrets"
  homepage "https://github.com/brandoncarl/larp"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/brandoncarl/larp/releases/download/v0.1.7/larp-v0.1.7-darwin-arm64.tar.gz"
      sha256 "b3dc7fda3e8a19bd5c336016e46ad6b407a041db4a255ddb5fc37db7823f3f74"
    end

    on_intel do
      url "https://github.com/brandoncarl/larp/releases/download/v0.1.7/larp-v0.1.7-darwin-x86_64.tar.gz"
      sha256 "4fdd50c54a527d52e67ced1b9db397474a37aab0c0f7037b1343fe0a73c2b367"
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
