class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.10.0-aarch64-apple-darwin.tar.gz"
    checksum = "c023762f970b193fe3b24124d3956451e39343bf28c446f3b13214fefc1684c8"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.10.0-x86_64-apple-darwin.tar.gz"
    checksum = "bf248fdbd2859c617113b2e25734c55ba449b500fc4abdfdb0869558c7578173"
  elsif host_os.include?("linux")
    archive = "cephi-0.10.0-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "30b5925b25f97ab6efab25c803045ee12bedf71be5727c1f69f2866ac87222b3"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.10.0/#{archive}"
  sha256 checksum
  license "MIT"

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
