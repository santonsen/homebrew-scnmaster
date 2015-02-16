require "formula"

class Scnmaster < Formula
  homepage "http://shortcutoslo.no"
  url "https://github.com/santonsen/homebrew-scnmaster/raw/master/dist/scnmaster_0.0.2/scnmaster_0.0.2.tar.gz"
  sha1 "3614ff3e448f545c8a4a2e3d63be839aa9d78848"

  depends_on "ffmpeg"

  def install
    # Remove unrecognized options if warned by configure
    system "make", "prefix=#{prefix}",
                   "install"
  end
end
