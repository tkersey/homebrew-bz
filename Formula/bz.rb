class Bz < Formula
  desc "Zig implementation of the br protocol"
  homepage "https://github.com/tkersey/bz"
  url "https://github.com/tkersey/bz/archive/2e12026fb4c041142c173887d353e35067c4ef33.tar.gz"
  sha256 "23b8f7fa4cf74d17c0e181335fa1f2267477a844306f220351ac5992e8ad8d4d"
  license "MIT"
  head "https://github.com/tkersey/bz.git", branch: "main"

  depends_on "zig" => :build
  depends_on "sqlite"

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe", "--prefix", prefix
  end

  test do
    assert_match "bz", shell_output("#{bin}/bz version")
  end
end
