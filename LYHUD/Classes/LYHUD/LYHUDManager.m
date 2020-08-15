#import "LYHUDManager.h"
#import "LYMessageHUD.h"
#import "LYProgressHUD.h"

@interface LYHUDManager ()

@property (nonatomic, strong) NSMutableArray *subHUDs;

@end

@implementation LYHUDManager

+(instancetype)message:(NSString *)text view:(UIView *)view duration:(NSTimeInterval)duration animated:(BOOL)animated{
    
    LYMessageHUD *msg = [[LYMessageHUD alloc] initWithFrame:view.bounds];
    msg.showView = view;
    msg.text = text;
    
    [msg show:animated duration:duration completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [msg dismiss:animated];
        });
    }];
    
    return msg;
    
}

+(instancetype)showWithView:(UIView *)view text:(NSString *)text animated:(BOOL)animated{
    
    LYProgressHUD *progs = [[LYProgressHUD alloc] initWithFrame:view.bounds];
    progs.showView = view;
    progs.text = text;
    [progs show:animated duration:0 completion:nil];
    return progs;
    
}

-(void)dismiss:(BOOL)animated{
    
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
            for (UIView *view in self.subviews) {
                view.alpha = 0;
            }
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            [self.subHUDs removeObject:self];
        }];
    }else {
        [self removeFromSuperview];
        [self.subHUDs removeObject:self];
    }
    
}

#pragma mark - 控制HUD显示的方式
-(void)show:(BOOL)animated duration:(NSTimeInterval)duration completion:(void (^)(void))completion{
    
    [self addSubview:self.backView];
    [self.subHUDs addObject:self];
    
    if (animated) {
        self.alpha = 0;
        [self.showView addSubview:self];
        
        [UIView animateWithDuration:0.2 animations:^{
            self.alpha = 1;
        } completion:^(BOOL finished) {
            if (completion) {
                completion();
            }
        }];
    }else {
        [self.showView addSubview:self];
    }
    
}

#pragma mark - 数据源
-(NSMutableArray *)subHUDs{
    if (!_subHUDs) {
        _subHUDs = [NSMutableArray new];
    }
    return _subHUDs;
}

@end
