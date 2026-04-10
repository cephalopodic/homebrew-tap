class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"
  version "0.4.0"
  license "MIT"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.4.0-aarch64-apple-darwin.tar.gz"
    checksum = "677d541cce0448abab0b22d2a36f18d8e6dda579549e7790e17125b97cecec73"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.4.0-x86_64-apple-darwin.tar.gz"
    checksum = "2fa0b25485f5c13a22a7536cb74cae68cc516656161fb402295db66ab8f622fb"
  elsif host_os.include?("linux")
    archive = "cephi-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "0c3818144cf498eea7ccc3ed31f0334a4ea8e0905f40e9b534d671b4b82e47d5"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.4.0/#{archive}"
  sha256 checksum

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
