class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.14.0-aarch64-apple-darwin.tar.gz"
    checksum = "245e20acba2aff659919409fecb2a4316447ef4ddb40fbdcd10eed880a4674ed"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.14.0-x86_64-apple-darwin.tar.gz"
    checksum = "33f776a2fd41229bd534de33045375e51c84493b3d0a6a4855ec2544a2219728"
  elsif host_os.include?("linux")
    archive = "cephi-0.14.0-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "b1ed133872b9bff4a423bfb26b3faf42bdc94a324781ef1295d4eec953883906"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.14.0/#{archive}"
  sha256 checksum
  license "MIT"

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
