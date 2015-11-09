#
# Be sure to run `pod lib lint UIDevice-Utils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "UIDevice-Utils"
  s.version          = "0.1.0"
  s.summary          = "Category on UIDevice to distinguish between platforms by Device Model, Device Family or Inches and provide human-readable device names e.g. 'iPhone 6S Plus'"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
s.description      = <<-DESC Category to easy distinguish devices, family platform device, or device inches. DESC
  s.homepage         = "https://github.com/giuseppenucifora/UIDevice-Utils"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Giuseppe Nucifora" => "me@giuseppenucifora.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/UIDevice-Utils.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'UIDevice-Utils' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
