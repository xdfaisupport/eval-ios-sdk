#
# Be sure to run `pod lib lint ios-ai-eval-sdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ios-ai-eval-sdk'
  s.version          = '1.0.0'
  s.summary          = 'A short description of ios-ai-eval-sdk.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'git@github.com:xdfaisupport/ios-ai-eval-sdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xdfaisupport' => 'xdfaisupport@xdf.cn' }
  s.source           = { :git => 'git@github.com:xdfaisupport/eval-ios-sdk.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'ios-ai-eval-sdk/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ios-ai-eval-sdk' => ['ios-ai-eval-sdk/Assets/*.png']
  # }

  s.public_header_files = 'ios-ai-eval-sdk/Classes/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  s.vendored_libraries = 'ios-ai-eval-sdk/Classes/*.a'
  s.xcconfig = {"OTHER_LDFLAGS" => "-ObjC"}
  s.dependency 'SocketRocket'

end
