#
# Be sure to run `pod lib lint LYHUD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LYHUD'
  s.version          = '0.0.1'
  s.summary          = '对HUD简单封装.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  
  #import <LYHUD/LYHUD.h>
  例子1：
  [LYHUD message:@"HUD提示单纯" view:self.view];
  
  例子2：
  [LYHUD message:@"提示后有处理" view:self.view complete:^{
      NSLog(@"处理block");
  }];
  
  #import <LYHUDManager.h>
  例子3：
  LYHUDManager *hud = [LYHUDManager showWithView:self.view text:@"" animated:YES];

  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      [hud dismiss:YES];
  });
  
                       DESC

  s.homepage         = 'https://github.com/ly312/LYHUD'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '2554338284@qq.com' => '2554338284@qq.com' }
  s.source           = { :git => 'https://github.com/ly312/LYHUD.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LYHUD/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LYHUD' => ['LYHUD/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
