class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"
  version "0.3.2"
  license "MIT"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.3.2-aarch64-apple-darwin.tar.gz"
    checksum = "c82340035e9c63f2341556bd3c2d19178e20578b99be8fe720f669482ccf9b90"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.3.2-x86_64-apple-darwin.tar.gz"
    checksum = "61b06f1021b7eb5bc16c6a4de1461d566ac00658aab92ee87044499fb69a56d6"
  elsif host_os.include?("linux")
    archive = "cephi-0.3.2-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "aed62879ea90e3019e9bfef298410fe48e8125d8a5fa2a79e345cff53fefd885"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.3.2/#{archive}"
  sha256 checksum

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
