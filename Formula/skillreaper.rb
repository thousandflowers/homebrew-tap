class Skillreaper < Formula
  desc "Evidence-based pruning for your AI agent stack"
  homepage "https://github.com/thousandflowers/skillreaper"
  version "0.4.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_amd64.tar.gz"
    sha256 "02d96ba72ddab96431481e731b5cf6a412d6d1affc7250fe02af78846154a5b1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_arm64.tar.gz"
    sha256 "b08410dd3237779a447e891f06318a0f3343160092138af5091e21bf604093a0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_amd64.tar.gz"
    sha256 "6e5e29c462becfafcbbbf944764e600b889f8bec4f0ae813ef49a2cdee19e8c2"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_arm64.tar.gz"
    sha256 "30cf2d7c4d9ee8881d32bb25617eb528a27963509a799772826b7e7b8831d7fc"
  end

  def install
    bin.install "skillreaper" => "reap"
  end

  test do
    assert_match "reap #{version}", shell_output("#{bin}/reap version")
  end
end
