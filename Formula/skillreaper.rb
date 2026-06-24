class Skillreaper < Formula
  desc "Evidence-based pruning for your AI agent stack"
  homepage "https://github.com/thousandflowers/skillreaper"
  version "0.4.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_amd64.tar.gz"
    sha256 "3b80eff4fba9557899901c74bc0788ce42aaed0453ed1abccb2c988f48c71a44"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_arm64.tar.gz"
    sha256 "7fa5ff9f4a6bf957b72406e00b43125132e4b28f94dda0aca6b72e2b22d6fbca"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_amd64.tar.gz"
    sha256 "7fa5ff9f4a6bf957b72406e00b43125132e4b28f94dda0aca6b72e2b22d6fbca"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_arm64.tar.gz"
    sha256 "7fa5ff9f4a6bf957b72406e00b43125132e4b28f94dda0aca6b72e2b22d6fbca"
  end

  def install
    bin.install "skillreaper" => "reap"
  end

  test do
    assert_match "reap #{version}", shell_output("#{bin}/reap version")
  end
end
