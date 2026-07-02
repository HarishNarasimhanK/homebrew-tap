class Devforge < Formula
  desc "Developer-environment automation bootstrapper"
  homepage "https://github.com/HarishNarasimhanK/dev-forge"
  url "https://github.com/HarishNarasimhanK/dev-forge/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "5f92a58255d2ca845852cab0275c8a2209a29a1ab5ed86ae522ab148bc857589"
  license "MIT"
  version "0.1.8"

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
