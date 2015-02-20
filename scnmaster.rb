require "formula"

class Scnmaster < Formula
  homepage "http://shortcutoslo.no"
  url "https://github.com/santonsen/homebrew-scnmaster/raw/master/dist/scnmaster_0.0.4/scnmaster_0.0.4.tar.gz"
  sha1 "25e1276510bd024b35ae8d285f8dd81cbd41b97e"

  depends_on "ffmpeg"

  resource "pexpect" do
    url "https://pypi.python.org/packages/source/p/pexpect/pexpect-3.3.tar.gz"
    sha1 "25e1276510bd024b35ae8d285f8dd81cbd41b97e"
  end

  def install
    resource("pexpect").stage { system "python", *Language::Python.setup_install_args(libexec/"vendor")}
    system "make", "prefix=#{prefix}",
                   "install"
  end
end
