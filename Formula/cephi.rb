class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.9.0-aarch64-apple-darwin.tar.gz"
    checksum = "a88fbaf778cb1c7110b19f79c50935cd25263b5d684e27b3a00d157bc62d82d8"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.9.0-x86_64-apple-darwin.tar.gz"
    checksum = "291e638b2a91b2f64d0a54e7435ab404d36b8eae56ae5e96a60692dbfb60bbf9"
  elsif host_os.include?("linux")
    archive = "cephi-0.9.0-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "f480947373e00979167923f70e38647618f0e5a7f4a990986422f47d19aff9a7"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.9.0/#{archive}"
  sha256 checksum
  license "MIT"

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
