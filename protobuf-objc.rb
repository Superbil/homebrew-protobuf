require 'formula'

class ProtobufObjc < Formula
  homepage 'https://github.com/Superbil/protobuf-objc'
  url 'https://github.com/Superbil/protobuf-objc.git'
  sha256 'cf2eca908a8f171359df6c54acb70e0c098bcab1'

  head 'https://github.com/Superbil/protobuf-objc.git', :branch => 'develop'

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  depends_on 'protobuf250'

  def install
    protobuf = Formula["protobuf250"]
    ENV.prepend 'CXXFLAGS', '-DNDEBUG'
    ENV.append "LDFLAGS", "-L#{protobuf.lib}"
    ENV.append "CPPFLAGS", "-I#{protobuf.include}"

    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end
