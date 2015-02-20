require "formula"

class Scnmaster < Formula
  homepage "http://shortcutoslo.no"
  url "https://github.com/santonsen/homebrew-scnmaster/raw/master/dist/scnmaster_0.0.3/scnmaster_0.0.3.tar.gz"
  sha1 "841e7c5733c399d43b1eec8a50f5efa9129c018b"

  depends_on "ffmpeg"

  resource "pexpect" do
    url "https://pypi.python.org/packages/source/p/pexpect/pexpect-3.3.tar.gz"
    sha1 "841e7c5733c399d43b1eec8a50f5efa9129c018b"
  end

  def install
    resource("pexpect").stage { system "python", *Language::Python.setup_install_args(libexec/"vendor")}
    system "make", "prefix=#{prefix}",
                   "install"
  end
end
