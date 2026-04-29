class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.12.0-aarch64-apple-darwin.tar.gz"
    checksum = "f0b9c1e92e005285471b212b224249848be8e3fc7443ca04ea82ea2b1e7e028d"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.12.0-x86_64-apple-darwin.tar.gz"
    checksum = "f8f55f92fa23b2aa4c37ada080dc2583507a11eca7125de2c1e6866e5a021d54"
  elsif host_os.include?("linux")
    archive = "cephi-0.12.0-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "3c19fe5a40f8660ca19c87a2da6a652018a0c69493033091c2cd9a8f8aaa4f3e"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.12.0/#{archive}"
  sha256 checksum
  license "MIT"

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
