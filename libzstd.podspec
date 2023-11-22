Pod::Spec.new do |spec|
  spec.name         = "libzstd"
  spec.version      = "1.5.5"
  spec.summary      = "Cocoapods wrapper of facebook/zstd."

  spec.description  = <<-DESC
                   Zstandard, or zstd as short version, is a fast lossless compression algorithm, targeting real-time compression scenarios at zlib-level and better compression ratios. It"s backed by a very fast entropy stage, provided by Huff0 and FSE library.
                   DESC

  spec.homepage     = "https://facebook.github.io/zstd/#other-languages"

  spec.license      = "BSD"

  spec.author             = { "kongkaikai" => "kongkaikai@bytedance.com" }

  spec.ios.deployment_target = "9.0"
  spec.tvos.deployment_target = "9.0"
  spec.osx.deployment_target = "10.10"

  spec.source       = { :git => "https://github.com/facebook/zstd.git", :tag => "v#{spec.version}" }

  public_header_files = ["lib/zstd.h", "lib/zstd_errors.h", "lib/zdict.h"]

  spec.source_files = ['lib/{compress,common,decompress,dictBuilder}/**/*.{h,c}'] + public_header_files
  spec.public_header_files = public_header_files
  spec.swift_version = "5.0"

  spec.xcconfig = {
    "GCC_C_LANGUAGE_STANDARD" => "gnu11",
    "CLANG_CXX_LANGUAGE_STANDARD" => "gnu++14"
  }
end
