class Canary < Formula
  desc "Pixel-art fatigue bird that lives in Claude Code's status line"
  homepage "https://github.com/thousandflowers/canary"
  url "https://github.com/thousandflowers/canary/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "4d048a3eb48538a1b9bf7a65a1b22b046e7044769a8f47cb7bccbb4a85103986" # shasum -a 256 of the v0.5.0 tarball
  license "MIT"

  def install
    pkgshare.install "canary-statusline.sh", "install.sh", "uninstall.sh"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      canary lives in Claude Code's status line, not your shell. Wire it:

        sh #{opt_pkgshare}/install.sh

      Restart Claude Code to meet the bird. Tame it with CANARY_DISABLED,
      CANARY_MIN_SCORE, CANARY_SHOW_SCORE, CANARY_ERR_WEIGHT (see README).
    EOS
  end

  test do
    assert_path_exists pkgshare/"canary-statusline.sh"

    # Hermetic Claude Code mode: an empty transcript_path fixture plus
    # CANARY_STATE_FILE/CANARY_HISTORY_FILE pointed at testpath keep this from
    # reading the *tester's* real ~/.canary/history — without it, the script
    # falls back to shell-state mode (no transcript_path in the input) and
    # picks up the machine's actual fatigue debt, so this failed on any host
    # with real canary usage history (e.g. "chirpy" + "N nights past your
    # limit" instead of "fresh").
    transcript = testpath/"transcript.jsonl"
    transcript.write("")
    input = %Q({"cost":{"total_duration_ms":0},"transcript_path":"#{transcript}"})
    cmd = "CANARY_HISTORY_FILE=#{testpath}/history CANARY_STATE_FILE=#{testpath}/state " \
          "/bin/bash #{pkgshare}/canary-statusline.sh"
    output = pipe_output(cmd, input)
    assert_match "fresh", output
  end
end
