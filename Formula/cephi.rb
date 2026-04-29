class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.11.1-aarch64-apple-darwin.tar.gz"
    checksum = "a145cf04cc6fc0b8f517e5c11222fd93b9f75c8299057f130fdd7815320b3334"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.11.1-x86_64-apple-darwin.tar.gz"
    checksum = "b08f75915b655bf1610cdbb5523b24731aec1414b1aa001af0387a0235024a6f"
  elsif host_os.include?("linux")
    archive = "cephi-0.11.1-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "0c6039cc0929d76cbdcd662e475efaed671521c6e7119c630674e54a80943894"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.11.1/#{archive}"
  sha256 checksum
  license "MIT"

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
