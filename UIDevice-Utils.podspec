#
# Be sure to run `pod lib lint UIDevice-Utils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = "UIDevice-Utils"
s.version          = "1.0.5"
s.summary          = "Category on UIDevice to distinguish between platforms."
s.description      = "Category to easy distinguish devices, family platform device, or device inches. Provide human-readable device names e.g. 'iPhone 6S Plus' or enums e.g. 'UIDeviceGenerationModeliPhone6SPlus'"
s.homepage         = "https://github.com/giuseppenucifora/UIDevice-Utils"
# s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
s.license          = 'MIT'
s.author           = { "Giuseppe Nucifora" => "me@giuseppenucifora.com" }
s.source           = { :git => "https://github.com/giuseppenucifora/UIDevice-Utils.git", :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.platform     = :ios, '8.0'
s.requires_arc = true

s.source_files = 'Pod/Classes/**/*'

end
