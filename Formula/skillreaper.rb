class Skillreaper < Formula
  desc "Evidence-based pruning for your AI agent stack"
  homepage "https://github.com/thousandflowers/skillreaper"
  version "0.4.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_amd64.tar.gz"
    sha256 "55a7659aa4762b5ff28c35849e0112cbdf269bcf76a2227ea5f5b9d8ce62333a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_arm64.tar.gz"
    sha256 "616f53d07d01a45912880afe20bda7b7396dd593a515f4a7dce1469d64bd5715"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_amd64.tar.gz"
    sha256 "c39dcafd83ceab08706adc6789339743ccfee346309c0faa785403cdb121ad19"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_arm64.tar.gz"
    sha256 "0ec92a13c82b68bbd98730762fece204bd8c96b465063d1739dff57c95f0923f"
  end

  def install
    bin.install "skillreaper" => "reap"
  end

  test do
    assert_match "reap #{version}", shell_output("#{bin}/reap version")
  end
end
