class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.15.0-aarch64-apple-darwin.tar.gz"
    checksum = "898add142342bf98162f36ef00fdf1677f62199675784f32306aa9e7337c50e6"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.15.0-x86_64-apple-darwin.tar.gz"
    checksum = "18d67083c27cc30c626ec078ec6eaaf027dd91a64c51c8e5eccfc14728a3d5e1"
  elsif host_os.include?("linux")
    archive = "cephi-0.15.0-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "a35b320e5626a951e2780cd15a8f75f81b69ea4195f9dcc8cdd95bebb95ff6d8"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.15.0/#{archive}"
  sha256 checksum
  license "MIT"

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
