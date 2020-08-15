#import "LYMessageHUD.h"
#import "LYHUDConfig.h"

@implementation LYMessageHUD

-(void)setText:(NSString *)text{
    
    if (text.length > 0) {
        [self createLabelWithText:text];
        [self compositeElements];
    }
    
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
    
    CGRect frame = CGRectMake(0, 0, LYHUDWidth(self.textLabel) + LYHUDMinSpace, LYHUDHeight(self.textLabel) + LYHUDMinSpace);
    self.backView = [[UIView alloc] initWithFrame:frame];
    self.backView.backgroundColor = LYHUDBGColor;
    self.backView.layer.cornerRadius = LYHUDRadius;
    
    self.textLabel.center = CGPointMake(LYHUDMidX(self.backView), LYHUDMidY(self.backView));
    self.backView.center = CGPointMake(LYHUDMidX(self.showView), LYHUDMidY(self.showView));
    
    [self.backView addSubview:self.textLabel];
    
}

@end
