class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"
  version "0.7.0"
  license "MIT"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.7.0-aarch64-apple-darwin.tar.gz"
    checksum = "9644858708e8bb5d3d5a2584d52f539cd278356bcf345ffff0807f0ec0d87a8b"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.7.0-x86_64-apple-darwin.tar.gz"
    checksum = "4c72c465d04762fcac217654fbe2f3baa6aeccee0b2b71418ea7091bd691336f"
  elsif host_os.include?("linux")
    archive = "cephi-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "97036a91c7169a1eaa6fdb929b7351e9a39a5761093012deab91db21cd869717"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.7.0/#{archive}"
  sha256 checksum

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
