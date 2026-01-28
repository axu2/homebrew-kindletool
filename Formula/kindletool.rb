class Kindletool < Formula
  desc "Tool for creating/extracting Kindle updates and more"
  homepage "https://github.com/NiLuJe/KindleTool"
  url "https://github.com/NiLuJe/KindleTool/archive/v1.6.6.tar.gz"
  sha256 "b8bb6ba7c135404e2d3c82fcf7b21e2c460593d80dcf415486a20fde108c1667"

  head "https://github.com/NiLuJe/KindleTool.git", shallow: false

  depends_on "pkg-config" => :build
  depends_on "NiLuJe/kindletool/libarchive-git"
  depends_on "nettle"

  def install
    ENV["GIT_DIR"] = cached_download/".git" if build.head?

    system "make"
    system "make", "install", "DESTDIR=#{prefix}", "PREFIX=/."
  end
end

