class Skillreaper < Formula
  desc "Evidence-based pruning for your AI agent stack"
  homepage "https://github.com/thousandflowers/skillreaper"
  version "0.6.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_amd64.tar.gz"
    sha256 "ba8396446b06688a1824d6d6e49c4d4ded574d1c48ce284e08f4cc5b4e17eebd"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_arm64.tar.gz"
    sha256 "0b1465c741c77abf0cc6a4f27eb3cef69ce29ffc3ccd487d9fba1879a9f80e97"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_amd64.tar.gz"
    sha256 "da95f8e46aa3e07a27887d22e58e608cd82c4c6762307a1917264491e1029015"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_arm64.tar.gz"
    sha256 "4e83e501f3cc8047cb705873391adc4d57bbaf9caf30dfcfed3974950dc48266"
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
