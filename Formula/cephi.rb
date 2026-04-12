class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.8.0-aarch64-apple-darwin.tar.gz"
    checksum = "92b9bf5a99e8c25fa982d9e458944b3f18c17776039eecbcd345d4253a8a8d5d"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.8.0-x86_64-apple-darwin.tar.gz"
    checksum = "cefb0f3e04370ccfd61b2204008b7ef6e06ecfd3f5acce19f805d1eac3d6d54e"
  elsif host_os.include?("linux")
    archive = "cephi-0.8.0-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "f183548ff92d95c51e70ea0b7764e3e433e5d70430c55d02489d3353b6653565"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.8.0/#{archive}"
  sha256 checksum
  license "MIT"

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
