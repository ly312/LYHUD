//
//  LYViewController.m
//  LYHUD
//
//  Created by 2554338284@qq.com on 08/15/2020.
//  Copyright (c) 2020 2554338284@qq.com. All rights reserved.
//

#import "LYViewController.h"
#import <LYHUD/LYHUD.h>
#import <LYHUDManager.h>

@interface LYViewController ()

@end

@implementation LYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *msgButon = [[UIButton alloc]initWithFrame:CGRectMake(20, 100, UIScreen.mainScreen.bounds.size.width - 40, 40)];
    [msgButon setTitle:@"HUD提示" forState:0];
    [msgButon setTitleColor:UIColor.blackColor forState:0];
    msgButon.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
    msgButon.tag = 0;
    [msgButon addTarget:self action:@selector(buttonSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:msgButon];
    
    UIButton *blockButon = [[UIButton alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(msgButon.frame) + 20, UIScreen.mainScreen.bounds.size.width - 40, 40)];
    [blockButon setTitle:@"提示后有处理" forState:0];
    [blockButon setTitleColor:UIColor.blackColor forState:0];
    blockButon.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
    blockButon.tag = 1;
    [blockButon addTarget:self action:@selector(buttonSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blockButon];
}

-(void)buttonSelect:(UIButton *)sender{
    
    if (sender.tag == 0) {
        [LYHUD message:@"HUD提示单纯" view:self.view];
    }else if (sender.tag == 1){
//        [LYHUD message:@"提示后有处理" view:self.view complete:^{
//            NSLog(@"处理block");
//        }];
        
        LYHUDManager *hud = [LYHUDManager showWithView:self.view text:@"" animated:YES];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud dismiss:YES];
        });
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
