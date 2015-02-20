require "formula"

class Scnmaster < Formula
  homepage "http://shortcutoslo.no"
  url "https://github.com/santonsen/homebrew-scnmaster/raw/master/dist/scnmaster_1.1.1/scnmaster_1.1.1.tar.gz"
  sha1 "eccfdd0df21b32d4321433c7b20316bc23205a5e"

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
