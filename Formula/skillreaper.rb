class Skillreaper < Formula
  desc "Evidence-based pruning for your AI agent stack"
  homepage "https://github.com/thousandflowers/skillreaper"
  version "0.9.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_amd64.tar.gz"
    sha256 "92aecb321556854ff73009d83acbd20cfe385b78bda87f329d2b46c74a1e0d58"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_darwin_arm64.tar.gz"
    sha256 "d39c30bf33071cc45947fee11275a632976bd5febb8cb575a9b980eeedea3e37"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_amd64.tar.gz"
    sha256 "d6d8b4da559f742a9fbf1180708eb142cba9ca6404af323d5d01401f4777d575"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/thousandflowers/skillreaper/releases/download/v#{version}/skillreaper_linux_arm64.tar.gz"
    sha256 "d8ce07a3d4490539032511f0d99b51e5a1753bcf8c56854dab3c0eb8b7f23d7f"
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
