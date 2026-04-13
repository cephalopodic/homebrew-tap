class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.8.2-aarch64-apple-darwin.tar.gz"
    checksum = "b6a4461c5d8b08b52322a2a329183e7796f0696e1e67bfb9b5f16c59a115d6d6"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.8.2-x86_64-apple-darwin.tar.gz"
    checksum = "4b7e71ea75298988363f18cc4c55a32c174185d5a8acd674d1438bea7363b61a"
  elsif host_os.include?("linux")
    archive = "cephi-0.8.2-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "df4b02c25df14f1673c452baa9742e6d5a65d3eb9b356ff830c47e3216dd39a4"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.8.2/#{archive}"
  sha256 checksum
  license "MIT"

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
