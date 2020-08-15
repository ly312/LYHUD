#import <UIKit/UIKit.h>

@interface LYHUDManager : UIView

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, weak) UIView *showView;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, copy) NSString *text;

//提示消息
+(instancetype)message:(NSString *)text view:(UIView *)view duration:(NSTimeInterval)duration animated:(BOOL)animated;

//持续提示
+(instancetype)showWithView:(UIView *)view text:(NSString *)text animated:(BOOL)animated;

//取消
-(void)dismiss:(BOOL)animated;

@end
