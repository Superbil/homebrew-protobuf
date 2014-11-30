require 'formula'

class ProtobufObjc < Formula
  homepage 'https://github.com/Superbil/protobuf-objc'
  url 'https://github.com/Superbil/protobuf-objc.git'
  sha1 '5655da9689e2fc1784d5cc5c770e5f4fb54a2bee'

  head 'https://github.com/Superbil/protobuf-objc.git', :branch => 'develop'

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool

  depends_on 'protobuf250'

  def install
    ENV.prepend 'CXXFLAGS', '-DNDEBUG'
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end
