class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"
  version "0.2.1"
  license "MIT"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.2.1-aarch64-apple-darwin.tar.gz"
    checksum = "1be3156a9fd781981855e1d65781507a396b2be3df3df6f383661ba4ad97e16e"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.2.1-x86_64-apple-darwin.tar.gz"
    checksum = "1c967fc6fd37f048372b31bfe492a50118244512c816e0cb5aef2763a568bc69"
  elsif host_os.include?("linux")
    archive = "cephi-0.2.1-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "a05f6812a2ccb4e583d50d96b2bcb4db878246b18491d726cce9616d54b71228"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.2.1/#{archive}"
  sha256 checksum

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
