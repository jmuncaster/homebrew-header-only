class Cppgsl < Formula
  desc "GSL: Guideline Support Library"
  homepage "https://github.com/Microsoft/GSL"
  url "https://github.com/Microsoft/GSL/archive/1f82596e1dada0067712527262a3d561ad51ddac.tar.gz"
  version "1f82596e1dada0067712527262a3d561ad51ddac"
  sha256 "92142e9af3d1194c016c9d90ded75867694f11835331055b7ee05e4c6ceed9a9"

  def install
    include.install "include/gsl"
  end

  test do
    (testpath/"test.cpp").write <<-EOS.undent
      #include <gsl/gsl>
      int main()
      {
        Expects(true);
        return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-I#{include}", "-L#{lib}", "-o", "test"
  end
end
