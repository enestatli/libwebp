Pod::Spec.new do |spec|
  spec.name         = "libwebp"
  spec.version      = "1.3.2"
  spec.summary      = "Library to encode and decode images in WebP format."
  spec.description  = <<-DESC
                       This pod includes support for encoding and decoding WebP images, along with examples.
                      DESC
  spec.homepage     = "https://developers.google.com/speed/webp/"
  spec.license      = { :type => "BSD", :file => "COPYING" }
  spec.author       = { "Google Inc." => "https://developers.google.com/" }
  spec.source       = { :git => "https://github.com/yourusername/libwebp.git", :tag => "v1.3.2-custom" }
  spec.platforms    = { :ios => "9.0", :osx => "10.10", :tvos => "9.0", :watchos => "2.0" }
  spec.requires_arc = false

  spec.pod_target_xcconfig = { "USER_HEADER_SEARCH_PATHS" => "$(inherited) ${PODS_ROOT}/libwebp/ ${PODS_TARGET_SRCROOT}/" }
  spec.compiler_flags = "-D_THREAD_SAFE"

  spec.preserve_paths = "src", "examples/*"
  spec.prepare_command = "sed -i '' 's/<inttypes.h>/<stdint.h>/g' './src/webp/types.h'"

  spec.subspec 'Core' do |core|
    core.source_files = 'src/webp/*.{h,c}', 'src/utils/*.{h,c}', 'src/dsp/*.{h,c}', 'src/dec/*.{h,c}', 'src/enc/*.{h,c}', 'examples/*.{c,h}'
    core.public_header_files = 'src/webp/*.h'
  end
end
