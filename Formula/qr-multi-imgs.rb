class QrMultiImgs < Formula
  desc "TUI to scan QR codes from an images folder, organize and export results"
  homepage "https://github.com/thousandflowers/qr-multi-imgs"
  version "1.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thousandflowers/qr-multi-imgs/releases/download/v#{version}/qr-multi-imgs_#{version}_macOS_arm64.tar.gz"
      sha256 "cd995df4ee3516d291f21586f80e1392e5e5579e317e758f86b58e7e0576119d"
    else
      url "https://github.com/thousandflowers/qr-multi-imgs/releases/download/v#{version}/qr-multi-imgs_#{version}_macOS_amd64.tar.gz"
      sha256 "6018d2584fc230ca2051375e10e5a04ba441b4a180cef9d9641dc5be4af9a944"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thousandflowers/qr-multi-imgs/releases/download/v#{version}/qr-multi-imgs_#{version}_linux_arm64.tar.gz"
      sha256 "3d2309df3acb59e7faa9db70d156d61c6c14f6497ff15a4debe7ebc177fa0a6b"
    else
      url "https://github.com/thousandflowers/qr-multi-imgs/releases/download/v#{version}/qr-multi-imgs_#{version}_linux_amd64.tar.gz"
      sha256 "3fa5c7cf53987d7025146ce9f258cc856d30a6baa3d9e865bb82307eacc65acb"
    end
  end

  def install
    bin.install "qr-multi-imgs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qr-multi-imgs --version")
  end
end
