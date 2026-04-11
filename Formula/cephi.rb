class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"
  version "0.6.0"
  license "MIT"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.6.0-aarch64-apple-darwin.tar.gz"
    checksum = "08dcc256b8085ed7e650b266effa633f3ed14171ecca670056bbb6ea9cc0fa10"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.6.0-x86_64-apple-darwin.tar.gz"
    checksum = "a01ff3c7299bc8f21d92351cdc7b823bd20306e4768c5bb02c6fd22b7495b090"
  elsif host_os.include?("linux")
    archive = "cephi-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "0dc8f9587767b2906ced5c4dad818ad4bd5378a5a0c361c1aae5a3a4aa8ef504"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.6.0/#{archive}"
  sha256 checksum

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
