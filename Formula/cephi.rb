class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.8.1-aarch64-apple-darwin.tar.gz"
    checksum = "7d8e0e50435a97a5879cb6ea6c896e26d0c15a59e90105791f60998bf55a3aad"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.8.1-x86_64-apple-darwin.tar.gz"
    checksum = "337a514066d23bcbc911535928720f918f16c3b27ddc731b5e1f629b0d760ac9"
  elsif host_os.include?("linux")
    archive = "cephi-0.8.1-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "a2d893d31330b1b451b8217b5e0cb127dc1c508aaf9f1089d7f11c0211c8c65f"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.8.1/#{archive}"
  sha256 checksum
  license "MIT"

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
