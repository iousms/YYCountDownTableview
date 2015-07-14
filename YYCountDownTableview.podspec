Pod::Spec.new do |s|
  s.name             = "YYCountDownTableview"
  s.version          = "1.0.0"
  s.summary          = "count down cell in tableview for iOS"
  s.description      = <<-DESC
                       It is a marquee view used on iOS, which implement by Objective-C.
                       DESC
  s.homepage         = "https://github.com/changcunyuan/CCZoomScrollView"
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "iousms" => "williamhan2011@sina.com" }
  s.source           = { :git => "https://github.com/iousms/YYCountDownTableview.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/NAME'

  s.platform     = :ios, '7.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'YYCountDownTableview.git/*'
  # s.resources = 'Assets'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'

  # s.public_header_files = 'ZoomScrollView/**/*.h'

  s.frameworks = 'Foundation', 'UIKit'
 

end
