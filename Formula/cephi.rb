class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"
  version "0.3.1"
  license "MIT"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.3.1-aarch64-apple-darwin.tar.gz"
    checksum = "0deee44eea9fec36211a41a780f922b8674a6b8a0ad13544bb4b9021cca4331f"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.3.1-x86_64-apple-darwin.tar.gz"
    checksum = "632c74956677832aed395d1a2babf5264e6dfadbfc664e0d12a27bd6f6e5160c"
  elsif host_os.include?("linux")
    archive = "cephi-0.3.1-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "d4a95bba5417e92ecf1fef4896b50c32fbfb78f55f5afcfc028476ef075e0674"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.3.1/#{archive}"
  sha256 checksum

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
