class QrMultiImgs < Formula
  desc "TUI to scan QR codes from an images folder, organize and export results"
  homepage "https://github.com/thousandflowers/qr-multi-imgs"
  version "1.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thousandflowers/qr-multi-imgs/releases/download/v#{version}/qr-multi-imgs_#{version}_macOS_arm64.tar.gz"
      sha256 "5c32616ab54cf0386c98548b3fe68785a787d02edd3ec29900b62a607e6a6f55"
    else
      url "https://github.com/thousandflowers/qr-multi-imgs/releases/download/v#{version}/qr-multi-imgs_#{version}_macOS_amd64.tar.gz"
      sha256 "aa209cef7272464891774161280c65720c7f5a668428b2fa6bd1bbb5ddd46613"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thousandflowers/qr-multi-imgs/releases/download/v#{version}/qr-multi-imgs_#{version}_linux_arm64.tar.gz"
      sha256 "1553c5abd0112b61f437cf6c9babe4f685984c0587ddb1e756c097ce096f5eca"
    else
      url "https://github.com/thousandflowers/qr-multi-imgs/releases/download/v#{version}/qr-multi-imgs_#{version}_linux_amd64.tar.gz"
      sha256 "f9b43d0a42a9277cd6537dc68c4da740d708534162377bb30251a0dd598b72ec"
    end
  end

  def install
    bin.install "qr-multi-imgs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qr-multi-imgs --version")
  end
end
