class Canary < Formula
  desc "Pixel-art fatigue bird that lives in your shell prompt"
  homepage "https://github.com/thousandflowers/canary"
  url "https://github.com/thousandflowers/canary/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "16f4a906218483443c25b261d467061fe677e1e604005e569e6cfe605e90e971"
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
