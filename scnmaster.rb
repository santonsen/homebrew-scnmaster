require "formula"

class Scnmaster < Formula
  homepage "http://shortcutoslo.no"
  url "https://github.com/santonsen/homebrew-scnmaster/raw/master/dist/scnmaster_0.0.2/scnmaster_0.0.2.tar.gz"
  sha1 "3614ff3e448f545c8a4a2e3d63be839aa9d78848"

  depends_on "ffmpeg"

  resource "pexpect" do
    url "https://pypi.python.org/packages/source/p/pexpect/pexpect-3.3.tar.gz"
    sha1 "0de72541d3f1374b795472fed841dce8"

  def install
    # Remove unrecognized options if warned by configure
    system "make", "prefix=#{prefix}",
                   "install"
  end
end
