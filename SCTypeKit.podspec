#
# Be sure to run `pod lib lint SCDataStructure.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SCTypeKit'
  s.version          = '0.1.0'
  s.summary          = 'SCTypeKit is currying style of construct attributed string and font'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  SCTypeKit is help us to easy that, currying style of construct attributed string and font
                       DESC

  s.homepage         = 'https://github.com/interactord/SCTypeKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'interactord' => 'interactord@gmail.com' }
  s.source           = { :git => 'https://github.com/interactord/SCTypeKit.git', :tag => s.version.to_s }
  s.swift_version = '5.0'

  s.ios.deployment_target = '12.1'

  s.source_files = 'SCTypeKit/**/*.swift'
  
  # s.resource_bundles = {
  #   'SCDataStructure' => ['SCDataStructure/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
