#
# Be sure to run `pod lib lint HPSCalendarView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HPSCalendarView'
  s.version          = '0.1.1'
  s.summary          = 'A UIView to repersent calendar UI in IOS applications.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A calendar UI for the IOS application to present to user to select date.As there is
no Calendar UI like we see in web inbuilt in ios so i decided to make one for those who want it to use in their applications
                       DESC

  s.homepage         = 'https://github.com/harry1064/HPSCalendarView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Harpreet Singh' => 'harry.singh1064@gmail.com' }
  s.source           = { :git => 'https://github.com/harry1064/HPSCalendarView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.facebook.com/harry1064'

  s.ios.deployment_target = '8.0'

  s.source_files = 'HPSCalendarView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HPSCalendarView' => ['HPSCalendarView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
