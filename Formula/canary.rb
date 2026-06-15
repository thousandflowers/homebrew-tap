class Canary < Formula
  desc "Pixel-art fatigue bird that lives in your shell prompt"
  homepage "https://github.com/thousandflowers/canary"
  url "https://github.com/thousandflowers/canary/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "3170060808b81cabc96937218e089d080dc4960e3802b5028329016ad9945e49"
  license "MIT"

  def install
    pkgshare.install "canary.sh", "canary.fish"
    doc.install "README.md", "demo.tape"
  end

  def caveats
    <<~EOS
      canary is a shell snippet, not a binary. Add it to your shell rc:

        zsh / bash:
          echo 'source #{opt_pkgshare}/canary.sh' >> ~/.zshrc      # or ~/.bashrc

        fish:
          echo 'source #{opt_pkgshare}/canary.fish' >> ~/.config/fish/config.fish

      Open a new shell to meet the bird. Control it with `canary status`,
      or CANARY_DISABLED / CANARY_RESET / CANARY_SHOW_SCORE.
    EOS
  end

  test do
    assert_path_exists pkgshare/"canary.sh"
    output = shell_output("/bin/bash -c '. #{pkgshare}/canary.sh; _canary_render 0 show'")
    assert_match "fresh", output
  end
end
