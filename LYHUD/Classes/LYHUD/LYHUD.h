#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYHUD : NSObject

/// HUD提示
/// @param message 提示消息
/// @param superView 需要添加HUD的View
+(void)message:(NSString *)message view:(UIView *)superView;

/// HUD提示
/// @param message 提示消息
/// @param superView 需要添加HUD的View
/// @param complete HUD消失后的处理操作
+(void)message:(NSString *)message view:(UIView *)superView complete:(void (^)(void))complete;

@end

NS_ASSUME_NONNULL_END
