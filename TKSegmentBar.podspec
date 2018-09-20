#
# Be sure to run `pod lib lint TKSegmentBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TKSegmentBar'
  s.version          = '0.2.2'
  s.summary          = 'TKSegmentBar'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  						TKSegmentBar是一款选择控制器
                       DESC

  s.homepage         = 'https://coding.net/u/CoderTitan/p/TKSegmentBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CoderTitan' => 'quanjunt@163.com' }
  s.source           = { :git => 'https://git.coding.net/CoderTitan/TKSegmentBar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TKSegmentBar/Classes/**/*'
  
  s.resource_bundles = {
    'TKSegmentBar' => ['TKSegmentBar/Assets/*']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'

end
