class Larp < Formula
  desc "Local action runner with 1Password-backed secrets"
  homepage "https://github.com/brandoncarl/larp"
  version "0.1.3"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/brandoncarl/larp/releases/download/v0.1.3/larp-v0.1.3-darwin-arm64.tar.gz"
      sha256 "9300d184a909f14b1614c95444fdfd3a5f818f809177b6801bda2823f0c19e51"
    end

    on_intel do
      url "https://github.com/brandoncarl/larp/releases/download/v0.1.3/larp-v0.1.3-darwin-x86_64.tar.gz"
      sha256 "2a2e5f13232f7b271b59fc98f439d82525f9c50e1455df4e7f9ed9352450f92b"
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
