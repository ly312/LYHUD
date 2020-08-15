#import "LYHUD.h"
#import "LYHUDManager.h"

@implementation LYHUD

+(void)message:(NSString *)message view:(UIView *)superView{
    if (message && message.length > 0) {
        [LYHUDManager message:message view:superView duration:1.0 animated:YES];
    }
}

+(void)message:(NSString *)message view:(UIView *)superView complete:(void (^)(void))complete{
    if (message && message.length > 0) {
        [LYHUDManager message:message view:superView duration:1.0 animated:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (complete) {
                complete();
            }
        });
    }
}

@end
