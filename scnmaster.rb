require "formula"

class Scnmaster < Formula
  homepage "http://shortcutoslo.no"
  url "https://github.com/santonsen/homebrew-scnmaster/raw/master/dist/scnmaster_0.0.7/scnmaster_0.0.7.tar.gz"
  sha1 "5245e122f251f70ac9ea8be279adc84cd93dc7ad"

  depends_on "ffmpeg"

  resource "pexpect" do
    url "https://pypi.python.org/packages/source/p/pexpect/pexpect-3.3.tar.gz"
    sha1 "fa7105069c4b546ace2b1b04e077aacf97550f93"
  end

  def install
    resource("pexpect").stage { system "python", *Language::Python.setup_install_args(libexec/"vendor") }

    system "make", "prefix=#{prefix}",
                   "install"
  end
end
