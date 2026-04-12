class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"
  version "0.7.3"
  license "MIT"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.7.3-aarch64-apple-darwin.tar.gz"
    checksum = "9e3920d0a73e8d8541db1ceaff02deec6cfbff9947ce9fc92523a7c71d39a39a"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.7.3-x86_64-apple-darwin.tar.gz"
    checksum = "0d49c514d234be751ef967b7e6c8a70cafca49a8cc6c8eb807cdc107a313c8df"
  elsif host_os.include?("linux")
    archive = "cephi-0.7.3-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "415ca32ccfac0ef2404c26e4ec0b2c2a75b5d3b32a2aaed54ad9c8817f01a70c"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.7.3/#{archive}"
  sha256 checksum

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
