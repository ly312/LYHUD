
# LYHUD

[![CI Status](https://img.shields.io/travis/2554338284@qq.com/LYHUD.svg?style=flat)](https://travis-ci.org/2554338284@qq.com/LYHUD)
[![Version](https://img.shields.io/cocoapods/v/LYHUD.svg?style=flat)](https://cocoapods.org/pods/LYHUD)
[![License](https://img.shields.io/cocoapods/l/LYHUD.svg?style=flat)](https://cocoapods.org/pods/LYHUD)
[![Platform](https://img.shields.io/cocoapods/p/LYHUD.svg?style=flat)](https://cocoapods.org/pods/LYHUD)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```ruby
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

## Requirements

## Installation

LYHUD is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:


pod 'LYHUD'
```

## Author

2554338284@qq.com, 2554338284@qq.com

## License

LYHUD is available under the MIT license. See the LICENSE file for more info.

