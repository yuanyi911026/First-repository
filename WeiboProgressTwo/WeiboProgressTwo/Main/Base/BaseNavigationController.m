//
//  BaseNavigationController.m
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/4.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "BaseNavigationController.h"
#import "ThemeManager.h"
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(themeChange) name:@"ThmeChangeNSNotification" object:nil];
    //[self themeChange];
    }
    return self;

}
- (void)themeChange {
   UIImage *image  = [[ThemeManager shareManager]themeImage:@"mask_navbar"];
    
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
}
-(void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ThmeChangeNSNotification" object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
