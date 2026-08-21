class Skillreaper < Formula
  desc "Evidence-based pruning for your AI agent stack"
  homepage "https://github.com/thousandflowers/skillreaper"
  version "0.6.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_amd64.tar.gz"
    sha256 "113c04345c8013e73ca152e3e905dc96a84bcc98dd50ac36995b7dd423541cd6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_arm64.tar.gz"
    sha256 "6816a1f78c1b1402794f05f82abaddbc679385229646fcbf8dd04657459c01e7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_amd64.tar.gz"
    sha256 "0828dd7859cad4b1ba1ba4947194d4d001e3006eab90445bd3cbc11d5612fafc"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_arm64.tar.gz"
    sha256 "0f93d248754fe2c14e7e9bc574e4c1f835d066ae2734a8752c13dfa4057624d9"
  end

  def install
    # The tarball ships the binary as "skillreaper" (goreleaser builds.binary);
    # the command has always been "reap", so it is renamed on install and the
    # package name is kept as an alias — whichever one a reader types works.
    bin.install "skillreaper" => "reap"
    bin.install_symlink bin/"reap" => "skillreaper"
  end

  test do
    assert_match "reap #{version}", shell_output("#{bin}/reap version")
    assert_match "reap #{version}", shell_output("#{bin}/skillreaper version")
  end
end
