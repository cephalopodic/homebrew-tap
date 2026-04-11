class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"
  version "0.5.0"
  license "MIT"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.5.0-aarch64-apple-darwin.tar.gz"
    checksum = "9f1891e6b08653e9f82f64864cdf5930edc766f8d3f2207b158b5c24a9fff03a"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.5.0-x86_64-apple-darwin.tar.gz"
    checksum = "1bb1abbae7c3eb85631bbd7ef11f2beb7d8e60883c1766b65500d5ed11e52f28"
  elsif host_os.include?("linux")
    archive = "cephi-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "5144009ec13df237345a145e42c93c022d039add2dd23b74e560692afdda0c73"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.5.0/#{archive}"
  sha256 checksum

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
