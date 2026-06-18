class Skillreaper < Formula
  desc "Evidence-based pruning for your AI agent stack"
  homepage "https://github.com/thousandflowers/skillreaper"
  version "0.3.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_amd64.tar.gz"
    sha256 "65350e7989ebab4ea0dd995df8736301b9efb0e0691d710a5f63ab46ce5bf1ff"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_arm64.tar.gz"
    sha256 "85baefe7be5717b4da6d757af8d1106bde13329b684e88844aa145ef00f12f52"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_amd64.tar.gz"
    sha256 "85baefe7be5717b4da6d757af8d1106bde13329b684e88844aa145ef00f12f52"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_arm64.tar.gz"
    sha256 "85baefe7be5717b4da6d757af8d1106bde13329b684e88844aa145ef00f12f52"
  end

  def install
    bin.install "skillreaper" => "reap"
  end

  test do
    assert_match "reap #{version}", shell_output("#{bin}/reap version")
  end
end
