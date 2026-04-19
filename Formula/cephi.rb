class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.11.0-aarch64-apple-darwin.tar.gz"
    checksum = "1f20b3fe47dff39e0ce465cb0c2984084f6d3c6703b50cd1518cb06fdc7d4339"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.11.0-x86_64-apple-darwin.tar.gz"
    checksum = "5f99ea80a4ff563defbfe5aa1758a27f6363593ec6937916699116c2858ec78c"
  elsif host_os.include?("linux")
    archive = "cephi-0.11.0-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "3933695298f3c4d107a3b25e85d7fd27d80708462d2bbede7b2ddf2d3b64561f"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.11.0/#{archive}"
  sha256 checksum
  license "MIT"

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
