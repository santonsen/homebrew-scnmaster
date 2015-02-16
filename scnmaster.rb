require "formula"

class Scnmaster < Formula
  homepage "http://shortcutoslo.no"
  url "https://github.com/santonsen/homebrew-scnmaster/raw/master/dist/scnmaster_0.0.2/scnmaster_0.0.2.tar.gz"
  sha1 "b853ad3a8bb970fec16136f405eacac4591630ff"

  def install
    # Remove unrecognized options if warned by configure
    system "make", "prefix=#{prefix}",
                   "install"
  end
end
