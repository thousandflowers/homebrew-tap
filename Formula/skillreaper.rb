class Skillreaper < Formula
  desc "Evidence-based pruning for your AI agent stack"
  homepage "https://github.com/thousandflowers/skillreaper"
  version "0.7.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_amd64.tar.gz"
    sha256 "3af58e6f018bf9c8ead0ce26e70d75ad4e2eeaa34d3b92558560e71bffa1e4d1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_arm64.tar.gz"
    sha256 "a064497594ab30868fd651523656d82e6018382b081581042f46d19810bb5d8b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_amd64.tar.gz"
    sha256 "f6f352b0441afafc63de280bafb61bc2c459eb588ae3f9ba9e91728cc5835de0"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_arm64.tar.gz"
    sha256 "3341c0000a497edf4608fa99a1db110f41d4e69c618ab1c6b785bbfc0214cdac"
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
