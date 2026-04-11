class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"
  version "0.7.2"
  license "MIT"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.7.2-aarch64-apple-darwin.tar.gz"
    checksum = "05937b69ba940afd4a2003cba59d6513bfda377dad8caa9cbae9da961fc43ee4"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.7.2-x86_64-apple-darwin.tar.gz"
    checksum = "b7ca57ded69968a6d33a15fd3514c61191d88aafb0000093dc001742cddef10a"
  elsif host_os.include?("linux")
    archive = "cephi-0.7.2-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "9c4d39f60dc608b1e2ad3b7c5389686d3830f491de158ca350899c9489722c8e"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.7.2/#{archive}"
  sha256 checksum

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
