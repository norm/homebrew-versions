class Cdparanoia < Formula
  desc "Audio extraction tool for sampling CDs"
  homepage "https://www.xiph.org/paranoia/"
  url "http://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-10.2.src.tgz"
  sha256 "005db45ef4ee017f5c32ec124f913a0546e77014266c6a1c50df902a55fe64df"

  depends_on "autoconf" => :build

  # Patches via MacPorts
  patch do
    url "https://raw.githubusercontent.com/Homebrew/formula-patches/2a22152/cdparanoia/osx_interface.patch"
    sha256 "3eca8ff34d2617c460056f97457b5ac62db1983517525e5c73886a2dea9f06d9"
  end

  patch do
    url "https://raw.githubusercontent.com/Homebrew/formula-patches/2a22152/cdparanoia/patch-paranoia_paranoia.c.10.4.diff"
    sha256 "4d6d51909d1b29a3c8ac349f5132a8acd96628355117efb3f192408d2cc4829e"
  end

  # Personal patch to provide "silent output but still with progress bar"
  patch do
    url "https://gist.githubusercontent.com/norm/969350/raw/9a883730e4632ccf9c242964f179f03b78ee6db7/gistfile1.diff"
    sha256 "aa523b41c0defab573ec82a97198af79f4b2c103490104d59110c639d30a7fd4"
  end

  def install
    system "autoconf"
    # Libs are installed as keg-only because most software that searches for cdparanoia
    # will fail to link against it cleanly due to our patches
    system "./configure", "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--libdir=#{libexec}"
    system "make", "all"
    system "make", "install"
  end
end
