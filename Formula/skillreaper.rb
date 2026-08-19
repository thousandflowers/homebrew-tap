class Skillreaper < Formula
  desc "Evidence-based pruning for your AI agent stack"
  homepage "https://github.com/thousandflowers/skillreaper"
  version "0.6.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_amd64.tar.gz"
    sha256 "26dfb6b54ba52f312548f5342a59202e8e535eae5e3bd6a9fd67bd9262d91385"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_arm64.tar.gz"
    sha256 "63385b8007dc80b37d890cc760694b5ba62f103d47c92f3c8b959c381c939c21"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_amd64.tar.gz"
    sha256 "6d3270a917b143c898e60e07c92eeea3bb5121d9877006382fd0997d9c9f821e"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_arm64.tar.gz"
    sha256 "85b4a188fe7e836eadb3d93e7525d046f2ef81328d528595c3950b6eedb804ab"
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
