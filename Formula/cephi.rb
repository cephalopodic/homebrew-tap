class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"
  version "0.2.0"
  license "MIT"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.2.0-aarch64-apple-darwin.tar.gz"
    checksum = "851ad9eebe2c15f5f31ec239ebd893885aa34f01ca810e6fd0523a314b1db396"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.2.0-x86_64-apple-darwin.tar.gz"
    checksum = "49340dda889da4c9463e1c425ee887a8ea775a275c439bb02a623da746f55f8d"
  elsif host_os.include?("linux")
    archive = "cephi-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "804c12048c88e12e8f4295b6e7264c97b5c0166e5620b5ae66ebc7ed253273bc"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
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
