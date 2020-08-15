#import "LYProgressHUD.h"
#import "LYHUDConfig.h"

@implementation LYProgressHUD

-(void)setText:(NSString *)text{
    
    [self createIndicatorView];
    if (text.length > 0) {
        [self createLabelWithText:text];
    }
    [self compositeElements];
    
}

#pragma mark - 创建loadingView
-(void)createIndicatorView{
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:0];
    [self.indicatorView startAnimating];
}

#pragma mark - 创建文本Label
-(void)createLabelWithText:(NSString *)text{
    
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.text = text;
    self.textLabel.textColor = LYHUDBGWhiteColor;
    
    self.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.textLabel sizeToFit];
    
    NSUInteger line = LYHUDWidth(self.textLabel) / LYHUDMaxWidth;
    if (line >= 1) {
        self.textLabel.numberOfLines = line + 1;
        self.textLabel.frame = CGRectMake(0, 0, LYHUDMaxWidth, LYHUDHeight(self.textLabel));
        CGSize size = [self.textLabel sizeThatFits:self.textLabel.frame.size];
        self.textLabel.frame = CGRectMake(0, 0, size.width, size.height);
    }
    
}

#pragma mark - 合成视图
-(void)compositeElements{
    
    //有提示文本的创建方式
    if (self.textLabel) {
        CGFloat width = LYHUDWidth(self.textLabel) > 50.0 ? LYHUDWidth(self.textLabel) + LYHUDMinSpace : LYHUDMinWidth;
        CGFloat height = LYHUDHeight(self.textLabel) + LYHUDMaxSpace;
        self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        
        self.indicatorView.center = CGPointMake(LYHUDMidX(self.backView), LYHUDMinSpace);
        self.textLabel.center = CGPointMake(LYHUDMidX(self.backView), ((LYHUDHeight(self.backView) + LYHUDHeight(self.indicatorView)) / 2) + 5.0);
        
        [self.backView addSubview:self.textLabel];
    }
    
    //无提示文本的创建方式
    else {
        self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LYHUDMinWidth, LYHUDMinWidth)];
        self.indicatorView.center = CGPointMake(LYHUDMidX(self.backView), LYHUDMidY(self.backView));
    }
    
    self.backView.backgroundColor = LYHUDBGColor;
    self.backView.layer.cornerRadius = LYHUDRadius;
    self.backView.center = CGPointMake(LYHUDMidX(self.showView), LYHUDMidY(self.showView));
    [self.backView addSubview:self.indicatorView];
    
}

@end
