class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"
  version "0.3.0"
  license "MIT"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.3.0-aarch64-apple-darwin.tar.gz"
    checksum = "2e10b7907bffd87463c8df5e0bc623271f9bd4bdc4064a1732e3812cdb2d52c6"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.3.0-x86_64-apple-darwin.tar.gz"
    checksum = "391dc6c1f590826d5dec04328b1ef6f74e782e4941ef088252c82b68074941a3"
  elsif host_os.include?("linux")
    archive = "cephi-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "225e19b0ffab7b4dbb400275fec996d13f41c73b8332a042afe24dc9fbf41c95"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.3.0/#{archive}"
  sha256 checksum

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
