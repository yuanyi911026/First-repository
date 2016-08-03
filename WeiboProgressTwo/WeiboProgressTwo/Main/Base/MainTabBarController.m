//
//  MainTabBarController.m
//  WeiboProgressTwo
//
//  Created by xiacheng on 16/8/3.
//  Copyright © 2016年 wuxianhulian. All rights reserved.
//

#import "MainTabBarController.h"
#import "Header.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadControllers];
    [self _removeSubViews];
    // Do any additional setup after loading the view.
}
- (void)_loadControllers {
    NSArray *nameArry = @[@"Home",@"Message",@"Profile",@"Discover",@"More"];
    NSMutableArray *controllerArry = [NSMutableArray array];
    for (NSString *name in nameArry) {
        UIStoryboard *stroyBoard = [UIStoryboard storyboardWithName:name bundle:nil];
        UIViewController *nav =[stroyBoard instantiateInitialViewController];
        [controllerArry addObject:nav];
    }
    self.viewControllers = controllerArry;
    
}
- (void)_removeSubViews {
    for (UIView *view  in self.tabBar.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            [view removeFromSuperview];
        }
        /*
         home_tab_icon_1
         */
        for (NSInteger i = 0; i < 5; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            NSString *imageName = [NSString stringWithFormat:@"home_tab_icon_%li",i+1];
            
            [self.tabBar addSubview:button];
            button.frame = CGRectMake(i*kScreenWidth/5, 0,kScreenWidth/5, 49);
            [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        }
//        self.tabBar.backgroundImage = [UIImage imageNamed:@"mask_titlebar.png"];
        [self.tabBar setBackgroundImage:[UIImage imageNamed:@"mask_titlebar"]];
    }



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
