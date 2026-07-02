class Devforge < Formula
  desc "Developer-environment automation bootstrapper"
  homepage "https://github.com/HarishNarasimhanK/dev-forge"
  url "https://github.com/HarishNarasimhanK/dev-forge/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "1c548910cd9beb96fb0116c360cbe24b3d8479a9ff56f03a295632342a676b65"
  license "MIT"
  version "0.1.9"

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
