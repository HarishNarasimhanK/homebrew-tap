class Devforge < Formula
  desc "Developer-environment automation bootstrapper"
  homepage "https://github.com/HarishNarasimhanK/dev-forge"
  url "https://github.com/HarishNarasimhanK/dev-forge/archive/refs/tags/v0.1.10.tar.gz"
  sha256 "02f43e80631d750ab6a407f75449c214f70bcf2d4867a3c494844ce865642e88"
  license "MIT"
  version "0.1.10"

  def install
    # Dynamically update the version string inside the wrapper script
    inreplace "dforge", 'VERSION="0.1.0"', "VERSION=\"#{version}\""

    # Install the dforge binary wrapper
    bin.install "dforge"

    # Install the rest of the repository assets to shared location
    pkgshare.install Dir["*"] - ["dforge"]
  end

  test do
    system "#{bin}/dforge", "version"
  end
end
