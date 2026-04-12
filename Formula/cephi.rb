class Cephi < Formula
  require "rbconfig"

  desc "Cephalopodic CLI for discovering and invoking taps through the API"
  homepage "https://github.com/cephalopodic/releases"
  version "0.7.4"
  license "MIT"

  host_os = RUBY_PLATFORM
  host_cpu = RbConfig::CONFIG.fetch("host_cpu")

  if host_os.include?("darwin") && host_cpu.match?(/arm|aarch64/)
    archive = "cephi-0.7.4-aarch64-apple-darwin.tar.gz"
    checksum = "5290be27044bbb4f799f72fb4b536b96b19dfb8d4b06b10902ebd05fbd354f70"
  elsif host_os.include?("darwin") && host_cpu == "x86_64"
    archive = "cephi-0.7.4-x86_64-apple-darwin.tar.gz"
    checksum = "190ef11469833641bce5b0d59a1f4386d74ebcb5c066235e84b7239f9a40c213"
  elsif host_os.include?("linux")
    archive = "cephi-0.7.4-x86_64-unknown-linux-gnu.tar.gz"
    checksum = "f2e831380b0fdeee5114a8c03677c236fd2b6ea928601d0ce3dfa7b1e6a82f8a"
  else
    raise "Unsupported platform for cephi: #{host_os} / #{host_cpu}"
  end

  url "https://github.com/cephalopodic/releases/releases/download/cephi-v0.7.4/#{archive}"
  sha256 checksum

  def install
    bin.install "cephi"
  end

  test do
    assert_match "cephi", shell_output("#{bin}/cephi --help")
  end
end
