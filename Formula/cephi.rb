class Cephi < Formula
  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"
  version "0.2.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    archive = "cephi-0.2.0-aarch64-apple-darwin.tar.gz"
    checksum = "851ad9eebe2c15f5f31ec239ebd893885aa34f01ca810e6fd0523a314b1db396"
  elsif OS.mac? && Hardware::CPU.intel?
    archive = "cephi-0.2.0-x86_64-apple-darwin.tar.gz"
    checksum = "49340dda889da4c9463e1c425ee887a8ea775a275c439bb02a623da746f55f8d"
  elsif OS.linux?
    archive = "cephi-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "804c12048c88e12e8f4295b6e7264c97b5c0166e5620b5ae66ebc7ed253273bc"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.2.0/#{archive}"
  sha256 checksum

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
