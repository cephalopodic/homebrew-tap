class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.13.0-aarch64-apple-darwin.tar.gz"
    checksum = "d1bf6edcc34ceb5921ec958a8f142e1c010d573db68b108508f9521fe4fc935e"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.13.0-x86_64-apple-darwin.tar.gz"
    checksum = "dc95f8d23b777a2747b1de14d9da78f59372c148641aad23f02a8e2a81f25df6"
  elsif host_os.include?("linux")
    archive = "cephi-0.13.0-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "1bf9c8a07ccd83b71e42b02902b7d74019c756250a97a6682e2b646489a83140"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.13.0/#{archive}"
  sha256 checksum
  license "MIT"

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
