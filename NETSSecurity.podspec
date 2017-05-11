Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "NETSSecurity"
  s.version      = "0.0.1"
  s.summary      = "Mobile SDK for NETSSecurity."

  s.author       = { "Tun Lin" => "tunlin@nets.com.sg" }
  s.license      = "BSD"
  s.homepage     = "http://raywenderlich.com"
  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/thomaswin/openssl.git" }

  s.source_files  = "NETSSecurity/**/*.{h,m}", "include-ios/openssl/**/*.h"
  s.public_header_files = 'include-ios/openssl/**/*.h'

  s.header_dir          = 'openssl'
  s.preserve_paths      = 'lib-ios/libcrypto.a', 'lib-ios/libssl.a'
  s.vendored_libraries  = 'lib-ios/libcrypto.a', 'lib-ios/libssl.a'
  s.libraries           = 'ssl', 'crypto'

  s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(PROJECT_DIR)/include-ios" }
  s.xcconfig = { "LIBRARY_SEARCH_PATHS" => "$(PROJECT_DIR)/NETSSecurity" }

end
