class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"
  version "0.7.1"
  license "MIT"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.7.1-aarch64-apple-darwin.tar.gz"
    checksum = "05b085c947ba934c6982c22e74249bfe86596ea9e36c01343c10fe229bedce01"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.7.1-x86_64-apple-darwin.tar.gz"
    checksum = "4b26cf48562a0c01b6374baca9cb9f721be0b9dc9ca697599231edfc4b0db669"
  elsif host_os.include?("linux")
    archive = "cephi-0.7.1-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "3fcb4aaf75e151f536e5786d74fa6a11173c075151087c3359b901788e9df872"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.7.1/#{archive}"
  sha256 checksum

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
