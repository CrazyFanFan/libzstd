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

  spec.subspec 'common' do |sp|
    sp.source_files = ['lib/common/**/*.{h,c}', "lib/zstd.h", "lib/zstd_errors.h"]
    sp.public_header_files = ["lib/zstd.h", "lib/zstd_errors.h"]
  end

  spec.subspec 'compress' do |sp|
    sp.source_files = ['lib/compress/**/*.{h,c}']
    sp.dependency 'libzstd/common'
  end

  spec.subspec 'decompress' do |sp|
    sp.source_files = ['lib/decompress/**/*.{h,c,S}']
    sp.dependency 'libzstd/common'
  end

  spec.subspec 'dictBuilder' do |sp|
    sp.source_files = ['lib/dictBuilder/**/*.{h,c}', "lib/zdict.h"]
    sp.public_header_files = ["lib/zdict.h"]
    sp.dependency 'libzstd/common'
    sp.dependency 'libzstd/compress'
  end

  spec.subspec 'full' do |sp|
    sp.dependency 'libzstd/dictBuilder'
    sp.dependency 'libzstd/decompress'
  end

  spec.default_subspecs = :none

  spec.swift_version = "5.0"

  spec.xcconfig = {
    "GCC_C_LANGUAGE_STANDARD" => "gnu11",
    "CLANG_CXX_LANGUAGE_STANDARD" => "gnu++14"
  }
end
