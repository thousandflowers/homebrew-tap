class Canary < Formula
  desc "Pixel-art fatigue bird that lives in your shell prompt"
  homepage "https://github.com/thousandflowers/canary"
  url "https://github.com/thousandflowers/canary/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "91b1bee240fbe2e1001d5786dde48107ebfb3d5fad9d3e3890f2895ccb215d66"
  license "MIT"

  def install
    pkgshare.install "canary.sh", "canary.fish", "canary-statusline.sh"
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
