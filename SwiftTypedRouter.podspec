#
# Be sure to run `pod lib lint SwiftTypedRouter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftTypedRouter'
  s.version          = '0.1.0'
  s.summary          = 'A strongly typed routing layer for SwiftUI'

  s.description      = <<-DESC
A strongly typed routing layer for SwiftUI. Convert paths to Views, and override them per-client app if included in a library.
                       DESC

  s.homepage         = 'https://github.com/deanWombourne/SwiftTypedRouter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'deanWombourne' => 'deanWombourne@gmail.com' }
  s.source           = { :git => 'https://github.com/deanWombourne/SwiftTypedRouter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'
  s.swift_versions = [ 4.0, 4.2, 5.0, 5.1 ]

  s.source_files = 'SwiftTypedRouter/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SwiftTypedRouter' => ['SwiftTypedRouter/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
