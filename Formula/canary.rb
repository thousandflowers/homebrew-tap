class Canary < Formula
  desc "Pixel-art fatigue bird for your shell prompt and Claude Code's status line"
  homepage "https://github.com/thousandflowers/canary"
  url "https://github.com/thousandflowers/canary/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "7358712c2bc216f4ac2ffea3d125f2b0d8295ead53149f622fc6ca33164f35e2" # shasum -a 256 of the v0.6.0 tarball
  license "MIT"

  def install
    # canary.sh and canary.fish belong here too. Without them install.sh finds
    # no local copy beside itself and falls back to curling them from GitHub,
    # so `brew install` produced an installer that needed the network to finish
    # — and failed outright offline or behind a proxy.
    pkgshare.install "canary-statusline.sh", "canary.sh", "canary.fish",
                     "install.sh", "uninstall.sh"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      canary is two birds from one install: one above your shell prompt, one in
      Claude Code's status line. Wire whichever shell you use:

        sh #{opt_pkgshare}/install.sh

      Open a new shell, and restart Claude Code, to meet them. Tame with
      CANARY_DISABLED, CANARY_MIN_SCORE (71 = only once it matters),
      CANARY_SHOW_SCORE, CANARY_ERR_WEIGHT — see README.
    EOS
  end

  test do
    # every file install.sh needs must be here, or it silently reaches for the
    # network to finish the job
    %w[canary-statusline.sh canary.sh canary.fish install.sh uninstall.sh].each do |f|
      assert_path_exists pkgshare/f
    end

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

    # the shell bird must load and score in a real shell, not merely exist
    prompt = shell_output(
      "CANARY_NIGHT_MULT=100 CANARY_STATE_FILE=#{testpath}/s " \
      "/bin/bash -c '. #{pkgshare}/canary.sh; trap - DEBUG; canary score'",
    )
    assert_equal "0", prompt.strip
  end
end
