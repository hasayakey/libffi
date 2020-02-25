#
#  Be sure to run `pod spec lint libffi-iOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "libffi"
  spec.version      = "3.3"
  spec.summary      = "Compilers for high level languages generate code that follow certain conventions"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = <<-DESC
                        python generate-darwin-source-and-headers.py --only-ios
                      DESC

  spec.homepage     = "https://github.com/libffi/libffi"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  spec.license      = { :type => 'GNU', :file => 'LICENSE' }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  spec.author             = { "hasayakey" => "hasayakey@gmail.com" }
  # Or just: spec.author    = "hasayakey"
  # spec.authors            = { "hasayakey" => "hasayakey@gmail.com" }
  # spec.social_media_url   = "https://twitter.com/hasayakey"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  spec.platform     = :ios

  #  When using multiple platforms
  # spec.ios.deployment_target = "5.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source       = { :git => "https://github.com/hasayakey/libffi.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  spec.default_subspec = 'common', 'arm64', 'x86_64'

  spec.subspec 'common' do |_spec|
    _spec.source_files = 'darwin_common/src/closures.c', 'darwin_common/src/dlmalloc.c', 'darwin_common/src/prep_cif.c', 'darwin_common/src/types.c', 'darwin_common/include/*.h', 'darwin_ios/include/ffi_arm64.h', 'darwin_ios/include/ffi_x86_64.h', 'darwin_ios/include/fficonfig_arm64.h', 'darwin_ios/include/fficonfig_x86_64.h', 'darwin_ios/include/ffitarget_arm64.h', 'darwin_ios/include/ffitarget_x86_64.h'
    _spec.public_header_files = 'darwin_common/include/*.h', 'darwin_ios/include/ffi_arm64.h', 'darwin_ios/include/ffi_x86_64.h', 'darwin_ios/include/fficonfig_arm64.h', 'darwin_ios/include/fficonfig_x86_64.h', 'darwin_ios/include/ffitarget_arm64.h', 'darwin_ios/include/ffitarget_x86_64.h'
  end

  spec.subspec 'arm64' do |_spec|
    _spec.source_files = 'darwin_ios/src/aarch64/ffi_arm64.c', 'darwin_ios/src/aarch64/internal.h', 'darwin_ios/src/aarch64/sysv_arm64.S', 'darwin_ios/include/ffi_arm64.h', 'darwin_ios/include/fficonfig_arm64.h', 'darwin_ios/include/ffitarget_arm64.h', 'darwin_common/include/ffi.h', 'darwin_common/include/fficonfig.h', 'darwin_common/include/ffitarget.h'
    _spec.private_header_files = 'darwin_ios/src/aarch64/internal.h'
    _spec.dependency 'libffi/common'
  end

  spec.subspec 'x86_64' do |_spec|
    _spec.source_files = 'darwin_ios/src/x86/ffi64_x86_64.c', 'darwin_ios/src/x86/ffiw64_x86_64.c', 'darwin_ios/src/x86/internal64.h', 'darwin_ios/src/x86/unix64_x86_64.S', 'darwin_ios/src/x86/win64_x86_64.S', 'darwin_ios/src/x86/asmnames.h', 'darwin_ios/include/ffi_x86_64.h', 'darwin_ios/include/fficonfig_x86_64.h', 'darwin_ios/include/ffitarget_x86_64.h', 'darwin_common/include/ffi.h', 'darwin_common/include/fficonfig.h', 'darwin_common/include/ffitarget.h'
    _spec.private_header_files = 'darwin_ios/src/x86/internal64.h', 'darwin_ios/src/x86/asmnames.h'
    _spec.dependency 'libffi/arm64'
  end


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
