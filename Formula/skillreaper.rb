class Skillreaper < Formula
  desc "Evidence-based pruning for your AI agent stack"
  homepage "https://github.com/thousandflowers/skillreaper"
  version "0.2.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_amd64.tar.gz"
    sha256 "8227d3b421047d80be7fba9bc9de9e5028e7f0b639153050c97abd5ede666026"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_arm64.tar.gz"
    sha256 "395a97a68f31fa0d2bc2e050009fe1516706a4e3a31a9bd1ca810fa6a945c78a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_amd64.tar.gz"
    sha256 "395a97a68f31fa0d2bc2e050009fe1516706a4e3a31a9bd1ca810fa6a945c78a"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_arm64.tar.gz"
    sha256 "395a97a68f31fa0d2bc2e050009fe1516706a4e3a31a9bd1ca810fa6a945c78a"
  end

  def install
    bin.install "skillreaper" => "reap"
  end

  test do
    assert_match "reap #{version}", shell_output("#{bin}/reap version")
  end
end
